import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'app_models.dart';
import 'datasource_models.dart';
part 'serializers.g.dart';

@SerializersFor(const [
  AppModel,
  AssetDatasourceModel,
  BaseDatasourceModel,
  ConfigModel,
  MenuModel,
  MenuItemModel,
  SubmenuModel,
  SubmenuItemModel
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
