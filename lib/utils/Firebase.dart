import 'package:firebase_remote_config/firebase_remote_config.dart';

class Firebase {
  Future<RemoteConfig> remoteConfig;

  Firebase() {
    remoteConfig = RemoteConfig.instance;
  }

  Future<String> getRemoteConfigString(String key) async {
    return (await remoteConfig).getString(key);
  }
}
