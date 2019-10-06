import 'package:flutter/material.dart';
import 'package:rishtaaunty/screens/AppScreen.dart';
import 'package:rishtaaunty/screens/SignInScreen.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:rishtaaunty/utils/App.dart';

import 'package:rishtaaunty/utils/App.dart' as Global;
//import 'utils/App.dart' as Global;
//import 'utils/App.dart' as app;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String _appTitle = 'Rishta Aunty';
  final ThemeData _appThemeData = ThemeData(primarySwatch: Colors.orange);

  @override
  Widget build(BuildContext context) {
    Global.App.init('app_rishtaaunty');
    return MaterialApp(
      title: _appTitle,
      theme: _appThemeData,
//      home: AppScreen(title: _appTitle),
      home: FutureBuilder<RemoteConfig>(
        future: Global.App.firebase.remoteConfig,
        builder: (BuildContext context, AsyncSnapshot<RemoteConfig> snapshot) {
          return snapshot.hasData
              ? WelcomeWidget(remoteConfig: snapshot.data)
              : Text('abcd');
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WelcomeWidget extends AnimatedWidget {
  WelcomeWidget({this.remoteConfig}) : super(listenable: remoteConfig);
  final RemoteConfig remoteConfig;
  @override
  Widget build(BuildContext context) {
    App.updateApp();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remote Config Example'),
      ),
      body: Center(
          child: Text(
              'A=${remoteConfig.getString('app_rishtaaunty')}}')),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () async {
            try {
              await remoteConfig.fetch(expiration: const Duration(seconds: 0));
              await remoteConfig.activateFetched();
            } on FetchThrottledException catch (exception) {
              // Fetch throttled.
              print(exception);
            } catch (exception) {
              print(
                  'Unable to fetch remote config. Cached or default values will be '
                  'used');
            }
          }),
    );
  }
}