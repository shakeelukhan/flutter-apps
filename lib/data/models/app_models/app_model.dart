import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '../base_model.dart';
import './app_page_model.dart';
part 'app_model.g.dart';

abstract class AppModel extends BaseModel<AppModel>
    implements Built<AppModel, AppModelBuilder> {
  static const FullType specifiedType = FullType(AppModel);
  static Serializer<AppModel> get serializer => _$appModelSerializer;

  AppPageModel get appPage;

  AppModel._();
  factory AppModel([updates(AppModelBuilder b)]) = _$AppModel;
  static AppModel fromJson(Map json) => BaseModel.fromJson(json, specifiedType);
}
