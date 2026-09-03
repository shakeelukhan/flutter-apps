import 'package:flutter/material.dart';
import 'package:the_betting_app/utils/SettingsHelper.dart';
import 'package:the_betting_app/utils/LoadingScreenHelper.dart';

class AllScreen extends StatefulWidget {
  @override
  _AllScreenState createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
  late LoadingScreenHelper _loadingScreen;
  late SettingsHelper _settings;
  String _allSettings = "";

  @override
  void initState() {
    super.initState();
    _settings = SettingsHelper();
    _loadingScreen = LoadingScreenHelper(true);
    _displayAllSettings();
  }

  // Read all settings
  Future<void> _displayAllSettings() async {
    await _settings.initialized;
    _settings.get().getKeys().forEach((key) =>
        _allSettings += key + '=' + _settings.get().get(key).toString() + '\n');
    _loadingScreen.isActive = false;
    if (this.mounted) {
      setState(() {});
    }
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
                "All Settings",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(color: Colors.grey),
              Expanded(
                flex: 1,
                child: ListView(children: <Widget>[
                  Text(
                    _allSettings,
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
