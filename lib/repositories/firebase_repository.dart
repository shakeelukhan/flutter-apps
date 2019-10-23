import 'package:meta/meta.dart';
import 'package:rishtaaunty/utils/utils.dart' as u;
import './base_repository.dart';

class FirebaseRepository<T> extends BaseRepository<T> {
  FirebaseRepository(
      {@required this.remoteConfigKey,
      @required this.jsonKey,
      this.remoteConfigDebugMode = false}) {
    _data = read();
  }

  final String remoteConfigKey, jsonKey;
  final bool remoteConfigDebugMode;
  Future<T> _data;
  Future<T> get data async => _data;

  Future<T> read() async => _data = _read();
  Future<T> _read() async {
    await u.FirebaseUtils.activateThenFetch();
    Map assetMap = await u.FirebaseUtils.getJson(remoteConfigKey);
    Map dataMap = assetMap[jsonKey];
    await u.FirebaseUtils.setDebugMode(this.remoteConfigDebugMode);
    return u.SerializerUtils.deserializeJson(dataMap);
  }
}
