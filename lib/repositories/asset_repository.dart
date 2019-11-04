import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:rishtaaunty/models/models.dart' as m;
import 'package:rishtaaunty/utils/utils.dart' as u;
import './base_repository.dart';

class AssetRepository<T extends m.BaseWidgetModel> extends BaseRepository<T> {
  AssetRepository({@required this.assetKey, @required this.jsonKey});

  final String assetKey, jsonKey;

  Future<T> _read() async {
//    Map assetMap = await u.asset.getJson(assetKey);
 //   Map dataMap = assetMap[jsonKey];
  //  m.BaseWidgetModel data = m.BaseWidgetModel.fromJson(dataMap);
  //  return data;
  }
}

class AssetRepository2<T extends m.BaseWidgetModel> extends BaseRepository<T> {
  final String assetKey;

  AssetRepository2(
      {@required this.assetKey, String sourceKey, @required String jsonKey})
      : super(sourceKey: assetKey, jsonKey: jsonKey);

 // Future<Map> getJson() async => await u.asset.getJson(assetKey);

  static Future<Map> getRemoteConfigJson(
      {@required String remoteConfigKey, bool debugMode}) async {
    await u.firebase.setDebug(debugMode);
    return await u.firebase.getSyncedJson(remoteConfigKey);
  }
}
