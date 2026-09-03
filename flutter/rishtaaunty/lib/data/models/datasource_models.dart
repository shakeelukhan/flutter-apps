import 'dart:async';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
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
          [void Function(AssetDatasourceModelBuilder)? updates]) =
      _$AssetDatasourceModel;
  factory AssetDatasourceModel.fromArgs(String key, {bool cache = true}) =>
      _$AssetDatasourceModel._(key: key, cache: cache);
  factory AssetDatasourceModel.fromJson(Map json) =>
      t.builtValue.deserialize(json, FullType(AssetDatasourceModel)) as AssetDatasourceModel;

  @override
  Future<String> getString() async =>
      rootBundle.loadString(this.key, cache: this.cache);

  @override
  Future<dynamic> getJson() async => t.io.stringToJson(await getString());
}

// RemoteConfigDatasourceModel (a Firebase Remote Config-backed datasource)
// used to live here. It was never actually instantiated anywhere in the
// app -- config.json's "rishta_aunty_local" entry (the one main.dart
// actually loads) uses AssetDatasourceModel; only the unused
// "rishta_aunty_cloud" entry referenced it. Removed along with the
// firebase_remote_config dependency rather than migrated, since keeping
// a real Firebase dependency around for genuinely dead code would mean
// this app needs live Firebase project credentials just to compile/run,
// contradicting the point of this modernization pass (UI-only, no
// backend wiring).
