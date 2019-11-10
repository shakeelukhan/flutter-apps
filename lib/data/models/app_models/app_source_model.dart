import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '../base_model.dart';
part 'app_source_model.g.dart';

abstract class AppSourceModel extends BaseModel<AppSourceModel>
    implements Built<AppSourceModel, AppSourceModelBuilder> {
  static const FullType specifiedType = FullType(AppSourceModel);
  static Serializer<AppSourceModel> get serializer =>
      _$appSourceModelSerializer;

  String get key;
  bool get local;
  bool get cache;

  AppSourceModel._();
  factory AppSourceModel([updates(AppSourceModelBuilder b)]) = _$AppSourceModel;
  static AppSourceModel fromJson(Map json) =>
      BaseModel.fromJson(json, specifiedType);
}
