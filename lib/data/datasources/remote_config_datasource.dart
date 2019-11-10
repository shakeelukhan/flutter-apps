import 'dart:async';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import './base_datasource.dart';

class RemoteConfigDatasource extends BaseDatasource {
  Future<RemoteConfig> _remoteConfig;
  Completer _ioCompleter;

  RemoteConfigDatasource(String key,
      {RemoteConfig remoteConfig, bool cache = true})
      : super(key, cache: cache) {
    _remoteConfig = remoteConfig ?? RemoteConfig.instance;
    _setDebug(this.cache == false ? true : false);
  }

  Future<void> _setDebug(bool debugMode) async => (await _remoteConfig)
      .setConfigSettings(RemoteConfigSettings(debugMode: debugMode));

  Future<String> _getString() async {
    RemoteConfig remoteConfig = (await _remoteConfig);
    this.cache == false
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
