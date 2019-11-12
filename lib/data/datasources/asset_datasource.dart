import 'dart:async';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/services.dart';
import 'package:rishtaaunty/utils/utils.dart' as u;
import 'base_datasource.dart';
part 'asset_datasource.g.dart';

abstract class AssetDatasource extends BaseDatasource
    implements Built<AssetDatasource, AssetDatasourceBuilder> {
  static Serializer<AssetDatasource> get serializer =>
      _$assetDatasourceSerializer;
  static void _initializeBuilder(AssetDatasourceBuilder b) => b..cache = true;

  String get key;
  bool get cache;

  AssetDatasource._();
  factory AssetDatasource([void Function(AssetDatasourceBuilder) updates]) =
      _$AssetDatasource;
  factory AssetDatasource.fromArgs(String key, {bool cache = true}) =>
      _$AssetDatasource._(key: key, cache: cache);
  factory AssetDatasource.fromJson(Map json) =>
      u.io.deserialize(json, FullType(AssetDatasource));

  @override
  Future<String> getString() async =>
      rootBundle.loadString(this.key, cache: this.cache);

  @override
  Future<dynamic> getJson() async => u.io.stringToJson(await getString());
}
