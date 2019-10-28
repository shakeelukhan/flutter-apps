part of './repositories.dart';

class AssetRepository<T> extends BaseRepository<T> {
  AssetRepository({@required this.assetKey, @required this.jsonKey});

  final String assetKey, jsonKey;

  Future<T> _read() async {
    Map assetMap = await u.asset.assetToJson(assetKey);
    Map dataMap = assetMap[jsonKey];
    return u.serializer.deserializeJson(dataMap);
  }
}
