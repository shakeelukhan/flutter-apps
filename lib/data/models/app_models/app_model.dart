import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rishtaaunty/data/data.dart';
import 'package:rishtaaunty/tools/tools.dart' as t;
import '../base_model.dart';
part 'app_model.g.dart';

abstract class AppModel extends BaseModel<AppModel>
    implements Built<AppModel, AppModelBuilder> {
  static void _initializeBuilder(AppModelBuilder b) => b
    ..debugPaintPointersEnabled = false
    ..debugPaintSizeEnabled = false
    ..debugShowCheckedModeBanner = false
    ..showPerformanceOverlay = false
    ..showSemanticsDebugger = false
    ..title = 'NULL_TITLE';
  static Serializer<AppModel> get serializer => _$appModelSerializer;

  bool get debugPaintPointersEnabled;
  bool get debugPaintSizeEnabled;
  bool get debugShowCheckedModeBanner;
  bool get showPerformanceOverlay;
  bool get showSemanticsDebugger;
  String get title;
  @nullable
  BuiltList<MenuItemModel> get menu;

  AppModel._();
  factory AppModel([void Function(AppModelBuilder) updates]) = _$AppModel;
  static AppModel fromJson(Map json) =>
      t.io.deserialize(json, FullType(AppModel));
}
