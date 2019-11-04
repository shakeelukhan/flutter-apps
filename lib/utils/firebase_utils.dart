import 'dart:async';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import './io_util.dart';

class FirebaseUtil {
  Future<RemoteConfig> _remoteConfig;
  bool _debug;

  Future<RemoteConfig> get remoteConfig => _remoteConfig;
  bool get debug => _debug;

  FirebaseUtil({RemoteConfig remoteConfig, bool debug}) {
    _remoteConfig = remoteConfig ?? RemoteConfig.instance;
    _debug = debug ?? false;
  }

  Future<void> setDebug(bool debug) async => (await _remoteConfig)
      .setConfigSettings(RemoteConfigSettings(debugMode: _debug = debug));

  Future<void> activateThenFetch() async {
    (await _remoteConfig).activateFetched();
    _debug == true
        ? (await _remoteConfig).fetch(expiration: Duration(seconds: 0))
        : (await _remoteConfig).fetch();
  }

  Future<String> getString(String remoteConfigKey) async =>
      (await _remoteConfig).getString(remoteConfigKey);

  dynamic getJson(String remoteConfigKey) async =>
      ioUtil.stringToJson(await getString(remoteConfigKey));

  dynamic getSyncedJson(String remoteConfigKey) async {
    await activateThenFetch();
    return getJson(remoteConfigKey);
  }
}

final FirebaseUtil firebaseUtil = FirebaseUtil();
