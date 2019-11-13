import 'dart:async';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:rishtaaunty/tools/tools.dart' as t;
import 'base_datasource.dart';
part 'remote_config_datasource.g.dart';

abstract class RemoteConfigDatasource extends BaseDatasource
    implements Built<RemoteConfigDatasource, RemoteConfigDatasourceBuilder> {
  static Future<RemoteConfig> remoteConfig = RemoteConfig.instance;
  static Serializer<RemoteConfigDatasource> get serializer =>
      _$remoteConfigDatasourceSerializer;
  static void _initializeBuilder(RemoteConfigDatasourceBuilder b) =>
      b..cache = true;

  String get key;
  bool get cache;

  RemoteConfigDatasource._() {
    setDebug(this.cache == false ? true : false);
  }
  factory RemoteConfigDatasource(
          [void Function(RemoteConfigDatasourceBuilder) updates]) =
      _$RemoteConfigDatasource;
  factory RemoteConfigDatasource.fromArgs(String key, {bool cache = true}) =>
      _$RemoteConfigDatasource._(key: key, cache: cache);
  factory RemoteConfigDatasource.fromJson(Map json) =>
      t.io.deserialize(json, FullType(RemoteConfigDatasource));

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
