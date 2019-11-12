import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import '../datasources/asset_datasource.dart';
import '../datasources/base_datasource.dart';
import '../datasources/remote_config_datasource.dart';
import 'app_models/app_model.dart';
import 'app_models/app_page_model.dart';
import 'config_models/config_model.dart';
part 'serializers.g.dart';

@SerializersFor(const [
  AppModel,
  AppPageModel,
  AssetDatasource,
  BaseDatasource,
  ConfigModel,
  RemoteConfigDatasource,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
