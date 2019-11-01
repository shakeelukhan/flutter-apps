part of './repositories.dart';

enum RepositorySourceType { AssetRepository, RemoteConfigRepository }

abstract class Repository<T extends m.BaseWidgetModel> {
  final String sourceKey, jsonKey;
  final RepositorySourceType repositorySourceType;

  Completer<T> _readCompleter;

  Repository(
      {@required this.repositorySourceType,
      @required this.sourceKey,
      @required this.jsonKey});

  Future<T> read() async {
    if (_readCompleter?.isCompleted != false) {
      _readCompleter = Completer<T>();
      _readCompleter.complete(await _read());
    }
    return _readCompleter.future;
  }

  Future<T> _read() async {
    print(await c.asset.loadJson(sourceKey));
    Map jsonMap = await getJson();
    Map dataMap = jsonKey == null ? jsonMap : jsonMap[jsonKey];
    m.BaseWidgetModel data = m.BaseWidgetModel.fromJson(dataMap);
    return data;
  }

  Future<Map> getJson();

  Future<Map> getJsonFromAsset({@required String assetKey}) async =>
      await u.asset.assetToJson(assetKey);

  static Future<Map> getJsonFromRemoteConfig(
      {@required String remoteConfigKey, bool debugMode}) async {
    debugMode ?? await u.firebase.setDebugMode(debugMode);
    return await u.firebase.remoteConfigToJson(remoteConfigKey);
  }
}

class Repository2<T extends m.BaseWidgetModel> {
  final String sourceKey, jsonKey;

  Repository2({@required this.sourceKey, @required this.jsonKey});

  Future<T> read() async {
    Map sourceJson = await c.asset.loadJson(sourceKey);
    Map dataJson = jsonKey == null ? sourceJson : sourceJson[jsonKey];
    m.BaseWidgetModel data = m.BaseWidgetModel.fromJson(dataJson);
    print(data.toJsonString());
    return data;
  }
}
