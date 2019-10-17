import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:rishtaaunty/utils/json_utils.dart';

class FirebaseUtils {
  FirebaseUtils._();
  factory FirebaseUtils({bool debugMode}) {
    setDebugMode(debugMode);
    return _firebaseUtils;
  }

  static final FirebaseUtils _firebaseUtils = FirebaseUtils._();
  static Future<RemoteConfig> remoteConfig = RemoteConfig.instance;
  static bool _debugMode = false;

  static void setDebugMode(bool debugMode) async {
    _debugMode = debugMode;
    RemoteConfigSettings settings = RemoteConfigSettings(debugMode: _debugMode);
    (await remoteConfig).setConfigSettings(settings);
  }

  static void activateThenFetch() async {
    (await remoteConfig).activateFetched();
    if (_debugMode == true) {
      (await remoteConfig).fetch(expiration: Duration(seconds: 0));
    } else {
      (await remoteConfig).fetch();
    }
  }

  static Future<String> getString({String remoteConfigKey}) async =>
      (await remoteConfig).getString(remoteConfigKey);

  static Future<dynamic> getJson({String remoteConfigKey}) async =>
      JsonUtils.stringToJson(await getString(remoteConfigKey: remoteConfigKey));
}
