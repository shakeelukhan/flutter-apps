import 'package:flutter/material.dart';
import 'package:thebettingapp/utils/SettingsHelper.dart';
import 'package:thebettingapp/utils/LoadingScreenHelper.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  LoadingScreenHelper _loadingScreen;
  SettingsHelper _settings;
  int _betLoseProbability;
  TextEditingController _minBetSizeController;

  @override
  void initState() {
    super.initState();
    _settings = new SettingsHelper();
    _loadingScreen = new LoadingScreenHelper(true);
    _minBetSizeController = new TextEditingController();
    _displaySettings();
  }

  // Load settings
  _displaySettings() async {
    await _settings.initialized;
    _betLoseProbability = _settings.get().getInt('game.bet_lose_probabiity');
    _minBetSizeController.text =
        _settings.get().getInt('game.min_bet_size').toString();

    if (this.mounted) {
      setState(() {
        _loadingScreen.isActive = false;
      });
    }
  }

  // Save settings
  _saveSettings() async {
    _settings.get().setInt('game.bet_lose_probabiity', _betLoseProbability);
    _settings
        .get()
        .setInt('game.min_bet_size', int.parse(_minBetSizeController.text));
  }

  @override
  Widget build(BuildContext context) {
    if (_loadingScreen.isActive == true) {
      return _loadingScreen.loadingScreenWidget();
    } else {
      return Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text(
                "Game Settings",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(color: Colors.grey),
              Expanded(
                flex: 1,
                child: ListView(
                  children: <Widget>[
                    Text("Bet lose probability: " +
                        _betLoseProbability.toString() +
                        "%"),
                    Slider(
                      min: 0,
                      max: 100,
                      value: _betLoseProbability.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          _betLoseProbability = newValue.round();
                          _saveSettings();
                        });
                      },
                      activeColor: Colors.deepOrange,
                      inactiveColor: Colors.deepOrange[100],
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Min bet size (\$)'),
                      keyboardType: TextInputType.number,
                      controller: _minBetSizeController,
                      onChanged: (String newValue) {
                        _saveSettings();
                      },
                      autocorrect: false,
                    ),
                  ],
                ),
              ),
            ],
          ));
    }
  }
}
