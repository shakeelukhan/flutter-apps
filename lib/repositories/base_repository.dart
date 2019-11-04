import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:rishtaaunty/models/models.dart' as m;
import 'package:rishtaaunty/utils/utils.dart' as u;

class BaseRepository<T extends m.BaseWidgetModel> {
  final String sourceKey, jsonKey;

  BaseRepository(
      {@required this.sourceKey,
      @required this.jsonKey});

  String sourceKeyToName(
      {@required String key}) {
    return 'a';
  }

  Future<T> read() async {
    Map sourceJson ;//= await c.asset.loadJson(sourceKey);
    Map dataJson = jsonKey == null ? sourceJson : sourceJson[jsonKey];
    m.BaseWidgetModel data = m.BaseWidgetModel.fromJson(dataJson);
   // print(data.toJsonString());
    return data;
  }

  static Future<Map> getJsonFromRemoteConfig(
      {@required String remoteConfigKey, bool debugMode}) async {
    debugMode ?? await u.firebase.setDebug(debugMode);
    return await u.firebase.getSyncedJson(remoteConfigKey);
  }
}
