import 'dart:async';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:meta/meta.dart';
import './base_datasource.dart';

class RemoteConfigDatasource extends BaseDatasource {
  Future<RemoteConfig> _remoteConfig;
  bool _cache;
  Completer _ioCompleter;

  RemoteConfigDatasource(
      {RemoteConfig remoteConfig, @required String remoteConfigKey, bool cache})
      : super(key: remoteConfigKey) {
    _remoteConfig = remoteConfig ?? RemoteConfig.instance;
    _cache = cache ?? true;
    setDebug(_cache == false ? true : false);
  }

  Future<void> setDebug(bool debugMode) async => (await _remoteConfig)
      .setConfigSettings(RemoteConfigSettings(debugMode: debugMode));

  Future<String> _getString() async {
    RemoteConfig remoteConfig = (await _remoteConfig);
    _cache == false
        ? await remoteConfig.fetch(expiration: Duration(seconds: 0))
        : await remoteConfig.fetch();
    await remoteConfig.activateFetched();
    return remoteConfig.getString(key);
  }

  Future<String> getString() async {
    await _ioCompleter?.future;
    _ioCompleter = Completer<String>();
    _ioCompleter.complete(_getString());
    return _ioCompleter.future;
  }
}
