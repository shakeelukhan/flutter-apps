import 'dart:async';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import './json_utils.dart';

class FirebaseUtils {
  FirebaseUtils._();
  static final FirebaseUtils _firebaseUtils = FirebaseUtils._();
  factory FirebaseUtils() => _firebaseUtils;

  static Future<RemoteConfig> _remoteConfig = RemoteConfig.instance;
  get remoteConfig => _remoteConfig;
  bool _debugMode = false;

  Future<void> setDebugMode(bool debugMode) async =>
      (await _remoteConfig).setConfigSettings(
          RemoteConfigSettings(debugMode: _debugMode = debugMode));

  Future<void> activateThenFetch() async {
    (await _remoteConfig).activateFetched();
    _debugMode == true
        ? (await _remoteConfig).fetch(expiration: Duration(seconds: 0))
        : (await _remoteConfig).fetch();
  }

  Future<String> getString(String remoteConfigKey) async =>
      (await _remoteConfig).getString(remoteConfigKey);

  dynamic getJson(String remoteConfigKey) async =>
      JsonUtils().stringToJson(await getString(remoteConfigKey));
}
