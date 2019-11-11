import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rishtaaunty/utils/utils.dart' as u;
import '../base_model.dart';
part 'config_source_model.g.dart';

abstract class ConfigSourceModel extends BaseModel<ConfigSourceModel>
    implements Built<ConfigSourceModel, ConfigSourceModelBuilder> {
  static void _initializeBuilder(ConfigSourceModelBuilder b) => b
    ..key = 'NULL_KEY'
    ..local = true
    ..cache = true;
  static Serializer<ConfigSourceModel> get serializer =>
      _$configSourceModelSerializer;

  String get key;
  bool get local;
  bool get cache;

  ConfigSourceModel._();
  factory ConfigSourceModel([void Function(ConfigSourceModelBuilder) updates]) =
      _$ConfigSourceModel;
  static ConfigSourceModel fromJson(Map json) =>
      u.io.deserialize(json, FullType(ConfigSourceModel));
}
