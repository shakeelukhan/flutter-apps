import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rishtaaunty/tools/tools.dart' as t;
import '../../datasources/base_datasource.dart';
import '../base_model.dart';
part 'config_model.g.dart';

abstract class ConfigModel extends BaseModel<ConfigModel>
    implements Built<ConfigModel, ConfigModelBuilder> {
  static Serializer<ConfigModel> get serializer => _$configModelSerializer;

  BuiltMap<String, BaseDatasource> get appDatasources;

  ConfigModel._();
  factory ConfigModel([void Function(ConfigModelBuilder) updates]) =
      _$ConfigModel;
  static ConfigModel fromJson(Map json) =>
      t.io.deserialize(json, FullType(ConfigModel));
}
