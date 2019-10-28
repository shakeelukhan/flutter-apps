import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '../serializers.dart';
import '../widget_model.dart';

part 'app_widget_model.g.dart';

abstract class AppWidgetModel extends WidgetModel
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

  String toJson() {
    return json.encode(
        modelSerializers.serializeWith(AppWidgetModel.serializer, this));
  }

  static AppWidgetModel fromJson(String jsonString) {
    return modelSerializers.deserializeWith(
        AppWidgetModel.serializer, json.decode(jsonString));
  }
}
