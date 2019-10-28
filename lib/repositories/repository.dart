part of './repositories.dart';

class Repository<T> {
  final Map _dataMap;
  T _data;
  Completer<T> _readCompleter;
  Map get dataMap => _dataMap;
  T get data => _data;
  Completer<T> get readCompleter => _readCompleter;

  Repository(this._dataMap);

  static Future<Repository> fromAssetJson({@required String assetKey}) async =>
      Repository(await u.asset.assetToJson(assetKey));

  static Future<Map> getRemoteConfigJson(
      {@required String remoteConfigKey, bool debugMode}) async {
    await u.firebase.setDebugMode(debugMode);
    return await u.firebase.remoteConfigToJson(remoteConfigKey);
  }

  Future<T> read() async {
    if (_readCompleter?.isCompleted != false) {
      _readCompleter = Completer<T>();
    }
    return _readCompleter.future;
  }

  T deserialize(String jsonKey) =>
      u.serializer.deserializeJson(_dataMap[jsonKey]);
}
