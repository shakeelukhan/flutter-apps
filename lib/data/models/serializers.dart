import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import '../datasources/asset_datasource.dart';
import '../datasources/base_datasource.dart';
import '../datasources/remote_config_datasource.dart';
import 'app_models/app_model.dart';
import 'app_models/config_model.dart';
import 'app_models/menu_item_model.dart';
part 'serializers.g.dart';

@SerializersFor(const [
  AppModel,
  AssetDatasource,
  BaseDatasource,
  ConfigModel,
  RemoteConfigDatasource,
  MenuItemModel,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
