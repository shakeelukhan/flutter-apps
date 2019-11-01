part of './repositories.dart';

class AssetRepository<T extends m.BaseWidgetModel> extends BaseRepository<T> {
  AssetRepository({@required this.assetKey, @required this.jsonKey});

  final String assetKey, jsonKey;

  Future<T> _read() async {
    Map assetMap = await u.asset.assetToJson(assetKey);
    Map dataMap = assetMap[jsonKey];
    m.BaseWidgetModel data = m.BaseWidgetModel.fromJson(dataMap);
    return data;
  }
}

class AssetRepository2<T extends m.BaseWidgetModel> extends Repository<T> {
  final String assetKey;

  AssetRepository2(
      {@required this.assetKey, String sourceKey, @required String jsonKey})
      : super(sourceKey: assetKey, jsonKey: jsonKey);

  Future<Map> getJson() async => await u.asset.assetToJson(assetKey);

  static Future<Map> getRemoteConfigJson(
      {@required String remoteConfigKey, bool debugMode}) async {
    await u.firebase.setDebugMode(debugMode);
    return await u.firebase.remoteConfigToJson(remoteConfigKey);
  }
}
