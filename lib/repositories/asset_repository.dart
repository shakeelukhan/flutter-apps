import 'package:meta/meta.dart';
import 'package:rishtaaunty/utils/utils.dart' as u;
import './base_repository.dart';

class AssetRepository<T> extends BaseRepository<T> {
  AssetRepository({@required this.assetKey, @required this.jsonKey}) {
    _data = read();
  }

  final String assetKey, jsonKey;
  Future<T> _data;
  Future<T> get data async => _data;

  Future<T> read() async => _data = _read();
  Future<T> _read() async {
    Map assetMap = await u.JsonUtils.assetToJson(assetKey);
    Map dataMap = assetMap[jsonKey];
    return u.SerializerUtils.deserialize<T>(dataMap);
  }
}
