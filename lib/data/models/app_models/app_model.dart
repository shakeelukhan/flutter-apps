import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rishtaaunty/utils/utils.dart' as u;
import '../base_model.dart';
import './app_page_model.dart';
part 'app_model.g.dart';

abstract class AppModel extends BaseModel<AppModel>
    implements Built<AppModel, AppModelBuilder> {
  static Serializer<AppModel> get serializer => _$appModelSerializer;

  AppPageModel get appPage;

  AppModel._();
  factory AppModel([void Function(AppModelBuilder) updates]) = _$AppModel;
  static AppModel fromJson(Map json) =>
      u.io.deserialize(json, FullType(AppModel));
}
