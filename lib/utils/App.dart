import 'package:moor_flutter/moor_flutter.dart';
import 'package:package_info/package_info.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:rishtaaunty/data/app_db.dart';
import 'package:rishtaaunty/utils/Firebase.dart';
import 'dart:convert';

class App {
  static String appKey;
  static AppDb appDb;
  static Firebase firebase;

  static init(String key) {
    appKey = key;
    appDb = new AppDb();
    firebase = new Firebase();
  }

  static Future<String> localAppVersion() async {
    return (await PackageInfo.fromPlatform()).version;
  }

  static Future<String> serverAppConfig() async {
    return firebase.getRemoteConfigString(appKey);
  }

  static Future<String> serverAppVersion() async {
    String config = await serverAppConfig();
    return config == '' ? '' : jsonDecode(config)['app']['version'].toString();
  }

  static Future<bool> isSynced() async {
    return (await localAppVersion()) == (await serverAppVersion());
  }

  static void updateApp() async {
    if (await isSynced() == false) {
      print('NEEDS_UPDATE:' + (await serverAppConfig()));
    }
    print(appDb);
  }
}
