import 'package:flutter/material.dart';
import 'package:the_betting_app/utils/SettingsHelper.dart';
import 'package:the_betting_app/utils/LoadingScreenHelper.dart';

class SessionScreen extends StatefulWidget {
  @override
  _SessionScreenState createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  late LoadingScreenHelper _loadingScreen;
  late SettingsHelper _settings;
  late TextEditingController _startAmountController;
  late TextEditingController _balanceController;
  late TextEditingController _goalController;
  late TextEditingController _unitSizeController;
  late TextEditingController _positiveProgressionPartsController;
  late TextEditingController _simulationCountController;

  @override
  void initState() {
    super.initState();
    _settings = SettingsHelper();
    _loadingScreen = LoadingScreenHelper(true);
    _startAmountController = TextEditingController();
    _balanceController = TextEditingController();
    _goalController = TextEditingController();
    _unitSizeController = TextEditingController();
    _positiveProgressionPartsController = TextEditingController();
    _simulationCountController = TextEditingController();
    _displaySettings();
  }

  // Load settings
  Future<void> _displaySettings() async {
    await _settings.initialized;
    _startAmountController.text =
        _settings.get().getInt('session.start_amount').toString();
    _balanceController.text =
        _settings.get().getInt('session.balance').toString();
    _goalController.text = _settings.get().getInt('session.goal').toString();
    _unitSizeController.text =
        _settings.get().getInt('session.unit_size').toString();
    _positiveProgressionPartsController.text =
        _settings.get().getInt('session.positive_progression_parts').toString();
    _simulationCountController.text =
        _settings.get().getInt('session.simulation_count').toString();
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
        .setInt('session.start_amount', int.parse(_startAmountController.text));
    _settings
        .get()
        .setInt('session.balance', int.parse(_balanceController.text));
    _settings.get().setInt('session.goal', int.parse(_goalController.text));
    _settings
        .get()
        .setInt('session.unit_size', int.parse(_unitSizeController.text));
    _settings.get().setInt('session.positive_progression_parts',
        int.parse(_positiveProgressionPartsController.text));
    _settings.get().setInt(
        'session.simulation_count', int.parse(_simulationCountController.text));
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
                "Session Settings",
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
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Start Amount (\$)'),
                      keyboardType: TextInputType.number,
                      controller: _startAmountController,
                      onChanged: (String newValue) {
                        _saveSettings();
                      },
                      autocorrect: false,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Balance (\$)'),
                      keyboardType: TextInputType.number,
                      controller: _balanceController,
                      onChanged: (String newValue) {
                        _saveSettings();
                      },
                      autocorrect: false,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Goal (\$)'),
                      keyboardType: TextInputType.number,
                      controller: _goalController,
                      onChanged: (String newValue) {
                        _saveSettings();
                      },
                      autocorrect: false,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Unit size (\$)'),
                      keyboardType: TextInputType.number,
                      controller: _unitSizeController,
                      onChanged: (String newValue) {
                        _saveSettings();
                      },
                      autocorrect: false,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Positive progression parts'),
                      keyboardType: TextInputType.number,
                      controller: _positiveProgressionPartsController,
                      onChanged: (String newValue) {
                        _saveSettings();
                      },
                      autocorrect: false,
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Simulation count'),
                      keyboardType: TextInputType.number,
                      controller: _simulationCountController,
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
