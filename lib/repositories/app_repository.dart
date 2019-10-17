import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:rishtaaunty/models/app_model.dart';
import 'package:meta/meta.dart';
import 'package:rishtaaunty/utils/firebase_utils.dart';
import 'package:rishtaaunty/utils/json_utils.dart';

abstract class Repository {
  AppModel data;

  Future<AppModel> read();
}

class FirebaseRepository extends Repository {
  FirebaseRepository({@required this.remoteConfigKey, @required this.jsonKey});

  final String remoteConfigKey, jsonKey;

  Future<AppModel> read() async => data = await _fromJsonAsset();

  Future<AppModel> _fromJsonAsset() async {
    FirebaseUtils.activateThenFetch();
    Map configJson = await FirebaseUtils.getJson(remoteConfigKey: remoteConfigKey);
    data = AppModel.fromJson(configJson[jsonKey]);
    FirebaseUtils.setDebugMode(data.remoteConfigDebugMode);
    return data;
  }
}

class AssetRepository extends Repository {
  AssetRepository({@required this.jsonAssetFilename, @required this.jsonKey});

  final String jsonAssetFilename, jsonKey;

  Future<AppModel> read() async => data = await _fromJsonAsset();

  Future<AppModel> _fromJsonAsset() async {
    String jsonString = await JsonUtils.assetToString(jsonAssetFilename);
    Map configJson = JsonUtils.stringToJson(jsonString);
    return data = AppModel.fromJson(configJson[jsonKey]);
  }
}
