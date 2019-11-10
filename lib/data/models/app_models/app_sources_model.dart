import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '../base_model.dart';
import './app_source_model.dart';
part 'app_sources_model.g.dart';

abstract class AppSourcesModel extends BaseModel<AppSourcesModel>
    implements Built<AppSourcesModel, AppSourcesModelBuilder> {
  static const FullType _specifiedType = FullType(AppSourcesModel);

  @override
  FullType getSpecifiedType() => _specifiedType;
  static Serializer<AppSourcesModel> get serializer =>
      _$appSourcesModelSerializer;

  BuiltMap<String, AppSourceModel> get sources;

  AppSourcesModel._();
  factory AppSourcesModel([updates(AppSourcesModelBuilder b)]) =
      _$AppSourcesModel;
  static AppSourcesModel fromJson(Map json) =>
      BaseModel.fromJson(json, _specifiedType);
}
