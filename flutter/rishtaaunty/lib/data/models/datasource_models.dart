import 'dart:async';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/services.dart';
import 'package:rishtaaunty/tools/tools.dart' as t;
part 'datasource_models.g.dart';

abstract class BaseDatasourceModel {
  Future<String> getString();

  Future<dynamic> getJson();
}

abstract class AssetDatasourceModel extends BaseDatasourceModel
    implements Built<AssetDatasourceModel, AssetDatasourceModelBuilder> {
  static Serializer<AssetDatasourceModel> get serializer =>
      _$assetDatasourceModelSerializer;
  static void _initializeBuilder(AssetDatasourceModelBuilder b) =>
      b..cache = true;

  String get key;
  bool get cache;

  AssetDatasourceModel._();
  factory AssetDatasourceModel(
          [void Function(AssetDatasourceModelBuilder) updates]) =
      _$AssetDatasourceModel;
  factory AssetDatasourceModel.fromArgs(String key, {bool cache = true}) =>
      _$AssetDatasourceModel._(key: key, cache: cache);
  factory AssetDatasourceModel.fromJson(Map json) =>
      t.builtValue.deserialize(json, FullType(AssetDatasourceModel));

  @override
  Future<String> getString() async =>
      rootBundle.loadString(this.key, cache: this.cache);

  @override
  Future<dynamic> getJson() async => t.io.stringToJson(await getString());
}

abstract class RemoteConfigDatasourceModel extends BaseDatasourceModel
    implements
        Built<RemoteConfigDatasourceModel, RemoteConfigDatasourceModelBuilder> {
  static Future<RemoteConfig> remoteConfig = RemoteConfig.instance;
  static Serializer<RemoteConfigDatasourceModel> get serializer =>
      _$remoteConfigDatasourceModelSerializer;
  static void _initializeBuilder(RemoteConfigDatasourceModelBuilder b) =>
      b..cache = true;

  String get key;
  bool get cache;

  RemoteConfigDatasourceModel._() {
    setDebug(this.cache == false ? true : false);
  }
  factory RemoteConfigDatasourceModel(
          [void Function(RemoteConfigDatasourceModelBuilder) updates]) =
      _$RemoteConfigDatasourceModel;
  factory RemoteConfigDatasourceModel.fromArgs(String key,
          {bool cache = true}) =>
      _$RemoteConfigDatasourceModel._(key: key, cache: cache);
  factory RemoteConfigDatasourceModel.fromJson(Map json) =>
      t.builtValue.deserialize(json, FullType(RemoteConfigDatasourceModel));

  Future<void> setDebug(bool debugMode) async => (await remoteConfig)
      .setConfigSettings(RemoteConfigSettings(debugMode: debugMode));

  @override
  Future<String> getString() async {
    RemoteConfig remoteConfigInstance = (await remoteConfig);
    this.cache == false
        ? await remoteConfigInstance.fetch(expiration: Duration(seconds: 0))
        : await remoteConfigInstance.fetch();
    await remoteConfigInstance.activateFetched();
    return remoteConfigInstance.getString(key);
  }

  @override
  Future<dynamic> getJson() async => t.io.stringToJson(await getString());
}
