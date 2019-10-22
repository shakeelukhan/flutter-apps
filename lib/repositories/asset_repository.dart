import 'package:meta/meta.dart';
import 'package:rishtaaunty/utils.dart';
import './base_repository.dart';

class AssetRepository<T> extends BaseRepository<T> {
  AssetRepository({@required this.assetKey, this.jsonKey}) {
    _data = read();
  }

  final String assetKey, jsonKey;
  Future<T> _data;
  Future<T> get data async => _data;

  Future<T> read() async => _data = _read();
  Future<T> _read() async {
    Map assetMap = await U.json.assetToJson(assetKey);
    Map dataMap = jsonKey == null ? assetMap : assetMap[jsonKey];
    return U.serializer.deserialize<T>(dataMap);
  }
}
