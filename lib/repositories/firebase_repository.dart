import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:rishtaaunty/models/models.dart' as m;
import 'package:rishtaaunty/utils/utils.dart' as u;
import './base_repository.dart';

class FirebaseRepository<T extends m.BaseWidgetModel>
    extends BaseRepository<T> {
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
    await u.firebase.setDebug(this.remoteConfigDebugMode);
    T _data = m.BaseWidgetModel.fromJson(dataMap);
    return _data;
  }
}
