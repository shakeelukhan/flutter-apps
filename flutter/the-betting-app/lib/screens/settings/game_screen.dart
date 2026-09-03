import 'package:flutter/material.dart';
import 'package:the_betting_app/utils/SettingsHelper.dart';
import 'package:the_betting_app/utils/LoadingScreenHelper.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late LoadingScreenHelper _loadingScreen;
  late SettingsHelper _settings;
  int _betLoseProbability = 0;
  late TextEditingController _minBetSizeController;

  @override
  void initState() {
    super.initState();
    _settings = SettingsHelper();
    _loadingScreen = LoadingScreenHelper(true);
    _minBetSizeController = TextEditingController();
    _displaySettings();
  }

  // Load settings
  Future<void> _displaySettings() async {
    await _settings.initialized;
    _betLoseProbability = _settings.get().getInt('game.bet_lose_probabiity')!;
    _minBetSizeController.text =
        _settings.get().getInt('game.min_bet_size').toString();

    if (this.mounted) {
      setState(() {
        _loadingScreen.isActive = false;
      });
    }
  }

  // Save settings
  void _saveSettings() {
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
