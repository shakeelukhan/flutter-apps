import 'package:meta/meta.dart';
import 'package:rishtaaunty/utils.dart';
import './base_repository.dart';

class FirebaseRepository<T> extends BaseRepository<T> {
  FirebaseRepository(
      {@required this.remoteConfigKey,
      this.jsonKey,
      this.remoteConfigDebugMode = false}) {
    _data = read();
  }

  final String remoteConfigKey, jsonKey;
  final bool remoteConfigDebugMode;
  Future<T> _data;
  Future<T> get data async => _data;

  Future<T> read() async => _data = _read();
  Future<T> _read() async {
    await U.firebase.activateThenFetch();
    Map assetMap = await U.firebase.getJson(remoteConfigKey);
    Map dataMap = jsonKey == null ? assetMap : assetMap[jsonKey];
    await U.firebase.setDebugMode(this.remoteConfigDebugMode);
    return U.serializer.deserialize<T>(dataMap);
  }
}
