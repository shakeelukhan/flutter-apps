import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rishtaaunty/utils/utils.dart' as u;
import '../base_model.dart';
part 'app_page_model.g.dart';

abstract class AppPageModel extends BaseModel<AppPageModel>
    implements Built<AppPageModel, AppPageModelBuilder> {
  static void _initializeBuilder(AppPageModelBuilder b) => b
    ..title = 'NULL_TITLE'
    ..debugPaintSizeEnabled = false
    ..debugPaintPointersEnabled = false
    ..debugShowCheckedModeBanner = false
    ..showPerformanceOverlay = false
    ..showSemanticsDebugger = false
    ..remoteConfigDebugMode = false;
  static Serializer<AppPageModel> get serializer => _$appPageModelSerializer;

  String get title;
  bool get debugPaintSizeEnabled;
  bool get debugPaintPointersEnabled;
  bool get debugShowCheckedModeBanner;
  bool get showPerformanceOverlay;
  bool get showSemanticsDebugger;
  bool get remoteConfigDebugMode;

  AppPageModel._();
  factory AppPageModel([void Function(AppPageModelBuilder) updates]) =
      _$AppPageModel;
  static AppPageModel fromJson(Map json) =>
      u.io.deserialize(json, FullType(AppPageModel));
}
