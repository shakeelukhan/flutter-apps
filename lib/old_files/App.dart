import 'dart:convert';
import 'package:package_info/package_info.dart';
import 'package:rishtaaunty/utils/utils.dart';
import 'AppDatabase.dart';

class AppConfig {
  static String appKey;
  static bool debugMode;
  static AppDatabase appDatabase;
  static String appConfig;
  static FirebaseUtil firebase;

  AppConfig._();
  static final AppConfig app = AppConfig._();

  static init(String key, {bool isDebugMode = false}) async {
    appKey = key;
    debugMode = isDebugMode;
    appDatabase = new AppDatabase();
    await appDatabase.init();
    firebase = new FirebaseUtil();
    updateAppIfMismatch();
  }

  @override
  static Future<void> terminate() async {
    await appDatabase.terminate();
  }

  static Future<String> localAppVersion() async {
    return (await PackageInfo.fromPlatform()).version;
  }

  static Future<String> getServerAppConfig() async {
    appConfig = await FirebaseUtil.getString(remoteConfigKey: appKey);
    return appConfig;
  }

  static Future<String> serverAppVersion() async {
    appConfig ??= await getServerAppConfig();
    return appConfig == ''
        ? ''
        : jsonDecode(appConfig)['app']['version'].toString();
  }

  static Future<bool> isSynced() async {
    return (await localAppVersion()) == (await serverAppVersion());
  }

  static void updateAppIfMismatch() async {
    if (await isSynced() == false) {
      String config = await getServerAppConfig();
      String appTitle = (config) == ''
          ? ''
          : jsonDecode(await config)['app']['title'].toString();
      print('UPDATING CONFIG: ${config}');
      print(appTitle);
    }

    appDatabase.test();
  }
}
