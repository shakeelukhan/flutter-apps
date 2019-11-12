import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rishtaaunty/utils/utils.dart' as u;
import '../base_model.dart';
part 'app_source_model.g.dart';

abstract class AppSourceModel extends BaseModel<AppSourceModel>
    implements Built<AppSourceModel, AppSourceModelBuilder> {
  static void _initializeBuilder(AppSourceModelBuilder b) => b
    ..key = 'NULL_KEY'
    ..local = true
    ..cache = true;
  static Serializer<AppSourceModel> get serializer =>
      _$appSourceModelSerializer;

  String get key;
  bool get local;
  bool get cache;

  AppSourceModel._();
  factory AppSourceModel([void Function(AppSourceModelBuilder) updates]) =
      _$AppSourceModel;
  static AppSourceModel fromJson(Map json) =>
      u.io.deserialize(json, FullType(AppSourceModel));
}
