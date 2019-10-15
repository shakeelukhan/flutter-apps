import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'dart:convert';

class FirebaseUtils {
  FirebaseUtils._();
  factory FirebaseUtils({bool debugMode}) {
    setDebugMode(debugMode);
    return _firebaseUtils;
  }

  static final FirebaseUtils _firebaseUtils = FirebaseUtils._();
  static Future<RemoteConfig> remoteConfig = RemoteConfig.instance;
  static bool _debugMode = false;

  static void setDebugMode(bool debugMode) async {
    _debugMode = debugMode;
    RemoteConfigSettings settings = RemoteConfigSettings(debugMode: _debugMode);
    (await remoteConfig).setConfigSettings(settings);
  }

  static void activateThenFetch() async {
    (await remoteConfig).activateFetched();
    if (_debugMode == true) {
      (await remoteConfig).fetch(expiration: Duration(seconds: 0));
    } else {
      (await remoteConfig).fetch();
    }
  }

  static Future<String> getString({String key}) async =>
      (await remoteConfig).getString(key);

  static Future<dynamic> getJson({String key}) async =>
      jsonDecode(await getString(key: key));
}
