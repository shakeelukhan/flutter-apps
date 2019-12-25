import 'package:flutter/material.dart';
import 'dart:math';
import 'package:thebettingapp/utils/SettingsHelper.dart';
import 'package:thebettingapp/utils/LoadingScreenHelper.dart';
import 'package:thebettingapp/utils/DataTableHelper.dart';

class MartingdaleScreen2 extends StatefulWidget {
  @override
  _MartingdaleScreen2State createState() => _MartingdaleScreen2State();
}

class _MartingdaleScreen2State extends State<MartingdaleScreen2> {
  LoadingScreenHelper loadingScreen;
  SettingsHelper settings;
  DataTableHelper dataTableHelper;
  int _maxSequence;
  TextEditingController _balanceController;
  int _balance;
  int _unitSize;
  int _betLoseProbability;

  _padString(String str, int width) {
    return str.padLeft(width);
  }

  _calculateMartingdale() async {
    await settings.initialized;
    dataTableHelper.tableRows.clear();

    int _betSize = _unitSize;
    int _lossAfterBet = _betSize;
    int _winAfterBet;
    for (int i = 0; i < _maxSequence; i++) {
      List<String> row = [];
      row.add((i + 1).toString());
      row.add(_betSize.toString());
      row.add("-" + _lossAfterBet.toString());
      _winAfterBet = 2 * _betSize - _lossAfterBet;
      row.add(_winAfterBet.toString());
      double lossStreakPercent =
          100 * pow((_betLoseProbability / 100), (i + 1));
      row.add(lossStreakPercent.toStringAsPrecision(2));
      dataTableHelper.tableRows.add(row);
      _betSize = _lossAfterBet;
      _lossAfterBet += _betSize;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    settings = new SettingsHelper();
    loadingScreen = new LoadingScreenHelper(true);
    _balanceController = new TextEditingController();
    _maxSequence = 6;
    dataTableHelper = new DataTableHelper();
    dataTableHelper
        .setDataTableHeaders(["#", "Bet \$", "LoseAB \$", "WinAB \$", "%"]);
    _loadSettings();
    _calculateMartingdale();
  }

  // Load settings
  _loadSettings() async {
    await settings.initialized;
    _betLoseProbability = settings.get().getInt('game.bet_lose_probabiity');
    _unitSize = settings.get().getInt('session.unit_size');
    _balance = settings.get().getInt('session.balance');
    _balanceController.text = _balance.toString();

    if (this.mounted) {
      setState(() {
        loadingScreen.isActive = false;
      });
    }
  }

  // Save settings
  _saveSettings() async {
    _balance = int.parse(_balanceController.text);
    settings.get().setInt('session.balance', int.parse(_balance.toString()));
  }

  @override
  Widget build(BuildContext context) {
    if (loadingScreen.isActive == true) {
      return loadingScreen.loadingScreenWidget();
    } else {
      return Container(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    color: Theme.of(context).primaryColor,
                    elevation: 20,
                    child: Text(
                      "ReCalc",
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    onPressed: () {
                      _calculateMartingdale();
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: DropdownButton<String>(
                      value: _maxSequence.toString(),
                      onChanged: (String newValue) {
                        setState(() {
                          _maxSequence = int.parse(newValue);
                          _calculateMartingdale();
                        });
                      },
                      items: <String>[
                        '1',
                        '2',
                        '3',
                        '4',
                        '5',
                        '6',
                        '7',
                        '8',
                        '9'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Balance (\$)'),
                      keyboardType: TextInputType.number,
                      controller: _balanceController,
                      onChanged: (String newValue) {
                        setState(() {
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
                      columns: dataTableHelper.getDataTableHeaders(),
                      rows: dataTableHelper.getDataTableRows(),
                    ),
                  )
                ]),
              ),
            ],
          ));
    }
  }
}
