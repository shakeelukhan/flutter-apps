import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '../base_model.dart';
part 'app_page_model.g.dart';

abstract class AppPageModel extends BaseModel<AppPageModel>
    implements Built<AppPageModel, AppPageModelBuilder> {
  String get title;

  @nullable
  bool get debugPaintSizeEnabled;

  @nullable
  bool get debugPaintPointersEnabled;

  @nullable
  bool get debugShowCheckedModeBanner;

  @nullable
  bool get showPerformanceOverlay;

  @nullable
  bool get showSemanticsDebugger;

  @nullable
  bool get remoteConfigDebugMode;

  AppPageModel._();
  factory AppPageModel([updates(AppPageModelBuilder b)]) = _$AppPageModel;

  static Serializer<AppPageModel> get serializer => _$appPageModelSerializer;

  static AppPageModel fromJson(Map json) =>
      BaseModel.fromJson<AppPageModel>(json);

  static AppPageModel fromJsonString(String jsonString) =>
      BaseModel.fromJsonString<AppPageModel>(jsonString);
}
