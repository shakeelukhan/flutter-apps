part of './repositories.dart';

class FirebaseRepository<T> extends BaseRepository<T> {
  FirebaseRepository(
      {@required this.remoteConfigKey,
      @required this.jsonKey,
      this.remoteConfigDebugMode = false});

  final String remoteConfigKey, jsonKey;
  final bool remoteConfigDebugMode;

  Future<T> _read() async {
    await u.firebase.activateThenFetch();
    Map assetMap = await u.firebase.getJson(remoteConfigKey);
    Map dataMap = assetMap[jsonKey];
    await u.firebase.setDebugMode(this.remoteConfigDebugMode);
    _data = u.serializer.deserializeJson(dataMap);
    return u.serializer.deserializeJson(dataMap);
  }
}
