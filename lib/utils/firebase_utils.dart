import 'dart:async';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import './json_utils.dart';

class FirebaseUtils {
  FirebaseUtils._();

  static Future<RemoteConfig> _remoteConfig = RemoteConfig.instance;
  static get remoteConfig async => await _remoteConfig;
  static bool _debugMode = false;

  static Future<void> setDebugMode(bool debugMode) async =>
      remoteConfig.setConfigSettings(
          RemoteConfigSettings(debugMode: _debugMode = debugMode));

  static Future<void> activateThenFetch() async {
    remoteConfig.activateFetched();
    _debugMode == true
        ? remoteConfig.fetch(expiration: Duration(seconds: 0))
        : remoteConfig.fetch();
  }

  static Future<String> getString(String remoteConfigKey) async =>
      remoteConfig.getString(remoteConfigKey);

  static dynamic getJson(String remoteConfigKey) async =>
      JsonUtils.stringToJson(await getString(remoteConfigKey));
}
