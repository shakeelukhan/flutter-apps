import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'dart:convert';

class FirebaseRemoteConfig {
  Future<RemoteConfig> remoteConfig;
  bool _debugMode;

  FirebaseRemoteConfig({bool asyncMode = true, bool debugMode = false}) {
    _init(asyncMode);
    if (debugMode == true) {
      setDebugMode(debugMode);
    }
  }

  Future<RemoteConfig> _init(bool asyncMode) async {
    remoteConfig = RemoteConfig.instance;
    return (asyncMode == true) ? remoteConfig : await remoteConfig;
  }

  void setDebugMode(bool debugMode) async {
    _debugMode = debugMode;
    RemoteConfigSettings settings = RemoteConfigSettings(debugMode: _debugMode);
    (await remoteConfig).setConfigSettings(settings);
  }

  void activateThenFetch() async {
    (await remoteConfig).activateFetched();
    if (_debugMode == true) {
      (await remoteConfig).fetch(expiration: Duration(seconds: 0));
    } else {
      (await remoteConfig).fetch();
    }
  }

  Future<String> getString({String key}) async =>
      (await remoteConfig).getString(key);

  Future<dynamic> getJson({String key}) async =>
      jsonDecode(await getString(key: key));
}
