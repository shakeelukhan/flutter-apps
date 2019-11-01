import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import './base_widget_model.dart';

part 'app_widget_model.g.dart';

abstract class AppWidgetModel extends BaseWidgetModel
    implements Built<AppWidgetModel, AppWidgetModelBuilder> {
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

  AppWidgetModel._();
  factory AppWidgetModel([updates(AppWidgetModelBuilder b)]) = _$AppWidgetModel;

  static Serializer<AppWidgetModel> get serializer =>
      _$appWidgetModelSerializer;
}
