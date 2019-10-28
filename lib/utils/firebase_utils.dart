import 'dart:async';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import './json_utils.dart';

final FirebaseUtils firebaseUtils = FirebaseUtils();

class FirebaseUtils {
  Future<RemoteConfig> _remoteConfig;
  bool _debugMode;
  Future<RemoteConfig> get remoteConfig => _remoteConfig;
  bool get debugMode => _debugMode;

  FirebaseUtils({RemoteConfig remoteConfig, bool debugMode}) {
    _remoteConfig = remoteConfig ?? RemoteConfig.instance;
    _debugMode = debugMode ?? false;
  }

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
      jsonUtils.stringToJson(await getString(remoteConfigKey));

  dynamic remoteConfigToJson(String remoteConfigKey) async {
    await activateThenFetch();
    return getJson(remoteConfigKey);
  }
}
