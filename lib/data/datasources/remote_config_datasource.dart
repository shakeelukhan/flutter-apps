import 'dart:async';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:rishtaaunty/utils/utils.dart' as u;
import './base_datasource.dart';
part 'remote_config_datasource.g.dart';

abstract class RemoteConfigDatasource extends BaseDatasource
    implements Built<RemoteConfigDatasource, RemoteConfigDatasourceBuilder> {
  static Serializer<RemoteConfigDatasource> get serializer =>
      _$remoteConfigDatasourceSerializer;

  @nullable
  Future<RemoteConfig> get remoteConfigFuture;
  String get key;
  bool get cache;
  set remoteConfigFuture(Future<RemoteConfig> r) => remoteConfigFuture = r;

  RemoteConfigDatasource._() {
    remoteConfigFuture = RemoteConfig.instance;
    _setDebug(this.cache == false ? true : false);
  }
  factory RemoteConfigDatasource(
          [void Function(RemoteConfigDatasourceBuilder) updates]) =
      _$RemoteConfigDatasource;
  factory RemoteConfigDatasource.fromArgs(String key, {bool cache = true}) =>
      _$RemoteConfigDatasource._(key: key, cache: cache);
  factory RemoteConfigDatasource.fromJson(Map json) =>
      u.io.deserialize(json, FullType(RemoteConfigDatasource));

  Future<void> _setDebug(bool debugMode) async => (await remoteConfigFuture)
      .setConfigSettings(RemoteConfigSettings(debugMode: debugMode));

  @override
  Future<String> getString() async {
    RemoteConfig remoteConfig = (await remoteConfigFuture);
    this.cache == false
        ? await remoteConfig.fetch(expiration: Duration(seconds: 0))
        : await remoteConfig.fetch();
    await remoteConfig.activateFetched();
    return remoteConfig.getString(key);
  }

  @override
  Future<dynamic> getJson() async => u.io.stringToJson(await getString());
}

abstract class RemoteConfigDatasource2 extends BaseDatasource
    implements Built<RemoteConfigDatasource2, RemoteConfigDatasource2Builder> {
  static Serializer<RemoteConfigDatasource2> get serializer =>
      _$remoteConfigDatasource2Serializer;

  String get key;
  @nullable
  Future<String> get key2;
  bool get cache;

  RemoteConfigDatasource2._();
  factory RemoteConfigDatasource2(
          [void Function(RemoteConfigDatasource2Builder) updates]) =
      _$RemoteConfigDatasource2;
  factory RemoteConfigDatasource2.fromArgs(String key, {bool cache = true}) =>
      _$RemoteConfigDatasource2._(key: key, cache: cache);
  factory RemoteConfigDatasource2.fromJson(Map json) =>
      u.io.deserialize(json, FullType(RemoteConfigDatasource2));

  @override
  Future<String> getString() async {
    return null;
  }

  @override
  Future<dynamic> getJson() async => u.io.stringToJson(await getString());
}
