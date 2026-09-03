import 'package:flutter/material.dart';
import 'package:thebettingapp/utils/SettingsHelper.dart';
import 'package:thebettingapp/utils/LoadingScreenHelper.dart';
import 'package:thebettingapp/utils/GameHelper.dart';

class SimulationScreen extends StatefulWidget {
  @override
  _SimulationScreenState createState() => _SimulationScreenState();
}

class _SimulationScreenState extends State<SimulationScreen> {
  late LoadingScreenHelper _loadingScreen;
  late SettingsHelper _settings;
  late GameHelper _gameHelper;
  late TextEditingController _balanceController,
      _goalController,
      _positiveProgressionPartsController;

  int _simulationCount = 1;

  @override
  void initState() {
    super.initState();
    _settings = SettingsHelper();
    _loadingScreen = LoadingScreenHelper(true);
    _balanceController = TextEditingController();
    _goalController = TextEditingController();
    _positiveProgressionPartsController = TextEditingController();
    _loadSettings();
  }

  // Load settings
  Future<void> _loadSettings() async {
    await _settings.initialized;
    _balanceController.text =
        _settings.get().getInt('session.balance').toString();
    _goalController.text = _settings.get().getInt('session.goal').toString();
    _positiveProgressionPartsController.text =
        _settings.get().getInt('session.positive_progression_parts').toString();
    _simulationCount = _settings.get().getInt('session.simulation_count')!;
    _gameHelper = GameHelper(
        _settings.get().getInt('game.bet_lose_probabiity')!,
        _settings.get().getInt('game.min_bet_size')!);

    if (this.mounted) {
      setState(() {
        _loadingScreen.isActive = false;
      });
    }
  }

  // Save settings
  void _saveSettings() {
    _settings
        .get()
        .setInt('session.balance', int.parse(_balanceController.text));
    _settings.get().setInt('session.goal', int.parse(_goalController.text));
    _settings.get().setInt('session.positive_progression_parts',
        int.parse(_positiveProgressionPartsController.text));
    _settings.get().setInt('session.simulation_count', _simulationCount);
  }

  // Run simulation
  Future<void> _runSimulation() async {
    List<String> systems = ["flat", "mart", "mart2"];
    int i = 0;
    do {
      //   bool printGameInfo = (i == 1) ? true : false;
      bool printGameInfo = false;
      _gameHelper.simulate(
          systems[i],
          printGameInfo,
          int.parse(_balanceController.text),
          int.parse(_goalController.text),
          _simulationCount,
          int.parse(_positiveProgressionPartsController.text));
      if (this.mounted) {
        setState(() {});
      }
      await Future.delayed(const Duration(seconds: 1));
      i++;
    } while (_gameHelper.isProcessing || i < systems.length);
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
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Goal (\$)'),
                      keyboardType: TextInputType.number,
                      controller: _goalController,
                      onChanged: (String newValue) {
                        setState(() {
                          _saveSettings();
                        });
                      },
                      autocorrect: false,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Parts (\$)'),
                      keyboardType: TextInputType.number,
                      controller: _positiveProgressionPartsController,
                      onChanged: (String newValue) {
                        setState(() {
                          _saveSettings();
                        });
                      },
                      autocorrect: false,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: MaterialButton(
                      color: Theme.of(context).primaryColor,
                      elevation: 20,
                      child: Text(
                        "Run",
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      onPressed: () {
                        _runSimulation();
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: DropdownButton<String>(
                      value: _simulationCount.toString(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _simulationCount = int.parse(newValue!);
                          _saveSettings();
                        });
                      },
                      items: <String>[
                        '1',
                        '2',
                        '10',
                        '100',
                        '1000',
                        '10000',
                        '100000',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Divider(color: Colors.grey),
              Expanded(
                flex: 1,
                child: ListView(children: <Widget>[
                  Text(
                    _gameHelper.results,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ]),
              ),
            ],
          ));
    }
  }
}
