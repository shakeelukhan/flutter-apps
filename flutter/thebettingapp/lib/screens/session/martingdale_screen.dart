import 'package:flutter/material.dart';
import 'dart:math';
import 'package:thebettingapp/utils/SettingsHelper.dart';
import 'package:thebettingapp/utils/LoadingScreenHelper.dart';
import 'package:thebettingapp/utils/DataTableHelper.dart';

class MartingdaleScreen extends StatefulWidget {
  @override
  _MartingdaleScreenState createState() => _MartingdaleScreenState();
}

class _MartingdaleScreenState extends State<MartingdaleScreen> {
  late LoadingScreenHelper _loadingScreen;
  late SettingsHelper _settings;
  late DataTableHelper _dataTableHelper;
  late TextEditingController _balanceController;
  int _startAmount = 0,
      _balance = 0,
      _endGoal = 0,
      _unitSize = 0,
      _positiveProgressionParts = 0;
  int _betLoseProbability = 0, _minBetSize = 0;
  int _nextBetSize = 0, _loseStreakValue = 0;
  double _betsToWin = 0;

  Future<void> _calculateMartingdale() async {
    await _settings.initialized;
    _dataTableHelper.tableRows.clear();

    int _betSize, _surplusExcludingBet = 0;
    if (_balance >= _endGoal) {
      _betSize = _unitSize;
    } else {
      _betSize = (_loseStreakValue > 0) ? _loseStreakValue : _unitSize;
      _surplusExcludingBet = _balance - _startAmount - _betSize;
      double _addToBet = _surplusExcludingBet / _positiveProgressionParts;
      _addToBet -= _addToBet % 5;
      _betSize += _addToBet > 0 ? _addToBet.toInt() : 0;
    }
    _betSize = _betSize > _balance ? _balance : _betSize;
    _betSize = _betSize > (_endGoal - _balance) ? (_endGoal - _balance) : _betSize;
    _betSize = _betSize < _minBetSize ? _minBetSize : _betSize;

    _nextBetSize = _betSize;
    _betsToWin = (_endGoal - _balance) / _nextBetSize;
    int _lossAfterBet =  _loseStreakValue + _betSize;

    int i = 0;
    while (_betSize >= _minBetSize) {
      int _winAfterBet = 2 * _betSize - _lossAfterBet;
      double lossStreakPercent =
          100 * pow((_betLoseProbability / 100), (i + 1)).toDouble();

      List<String> row = [];
      row.add(lossStreakPercent.toStringAsPrecision(2) + "%");
      row.add("\$" + _betSize.toString());
      row.add("\$-" + _lossAfterBet.toString() + "/" + _winAfterBet.toString());
      _dataTableHelper.tableRows.add(row);

      _betSize = _lossAfterBet;
      _betSize = (_balance - _lossAfterBet) < _betSize
          ? (_balance - _lossAfterBet)
          : _betSize;
      _lossAfterBet += _betSize;
      i++;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _settings = SettingsHelper();
    _loadingScreen = LoadingScreenHelper(true);
    _balanceController = TextEditingController();
    _dataTableHelper = DataTableHelper();
    _dataTableHelper.setDataTableHeaders(["Prob L", "Bet L", "Net L/W"]);
    _loseStreakValue = 0;
    _loadSettings();
    _calculateMartingdale();
  }

  // Load settings
  Future<void> _loadSettings() async {
    await _settings.initialized;
    _startAmount = _settings.get().getInt('session.start_amount')!;
    _balance = _settings.get().getInt('session.balance')!;
    // NB: was 'session.end_goal' -- no such settings key exists (only
    // 'session.goal', set by SessionScreen); the mismatch meant this always
    // read null and would throw at runtime the first time _endGoal was
    // used in a comparison. Fixed to read the key that's actually set.
    _endGoal = _settings.get().getInt('session.goal')!;
    _unitSize = _settings.get().getInt('session.unit_size')!;
    _positiveProgressionParts =
        _settings.get().getInt('session.positive_progression_parts')!;
    _betLoseProbability = _settings.get().getInt('game.bet_lose_probabiity')!;
    _minBetSize = _settings.get().getInt('game.min_bet_size')!;
    _balanceController.text = _balance.toString();

    if (this.mounted) {
      setState(() {
        _loadingScreen.isActive = false;
      });
    }
  }

  // Save settings
  void _saveSettings() {
    _balance = int.parse(_balanceController.text);
    _settings.get().setInt('session.balance', int.parse(_balance.toString()));
  }

  @override
  Widget build(BuildContext context) {
    if (_loadingScreen.isActive == true) {
      return _loadingScreen.loadingScreenWidget();
    } else {
      return Container(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: MaterialButton(
                      color: Theme
                          .of(context)
                          .primaryColor,
                      elevation: 20,
                      child: Text(
                        "Lose",
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      onPressed: () {
                        _loseStreakValue += _nextBetSize;
                        _balance -= _nextBetSize;
                        _balanceController.text = _balance.toString();
                        _calculateMartingdale();
                        _saveSettings();
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: MaterialButton(
                      color: Theme
                          .of(context)
                          .primaryColor,
                      elevation: 20,
                      child: Text(
                        "Win",
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      onPressed: () {
                        _loseStreakValue -= _nextBetSize;
                        _loseStreakValue =
                        (_loseStreakValue < 0) ? 0 : _loseStreakValue;
                        _balance += _nextBetSize;
                        _balanceController.text = _balance.toString();
                        _calculateMartingdale();
                        _saveSettings();
                      },
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Balance (\$)'),
                      keyboardType: TextInputType.number,
                      controller: _balanceController,
                      onChanged: (String newValue) {
                        setState(() {
                          _balance = int.parse(_balanceController.text);
                          _calculateMartingdale();
                          _saveSettings();
                        });
                      },
                      autocorrect: false,
                    ),
                  ),
                ],
              ),
              Divider(color: Colors.grey),
              Expanded(
                flex: 1,
                child: ListView(children: <Widget>[
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: _dataTableHelper.getDataTableHeaders(),
                      rows: _dataTableHelper.getDataTableRows(),
                    ),
                  )
                ]),
              ),
              Divider(color: Colors.grey),
              Text("BetsToGoal=" +
                  _betsToWin.toStringAsPrecision(2) +
                  " LoseStreakCount=" +
                  _loseStreakValue.toString()),
            ],
          ));
    }
  }
}
