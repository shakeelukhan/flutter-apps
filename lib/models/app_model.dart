import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import './model_widget.dart';
part 'app_model.g.dart';

abstract class AppModel extends ModelWidget
    implements Built<AppModel, AppModelBuilder> {
  static Serializer<AppModel> get serializer => _$appModelSerializer;

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

  AppModel._();
  // factory ModelApp([updates(ModelAppBuilder b)]) = _$ModelApp;
  factory AppModel([updates(AppModelBuilder b)]) => _$AppModel((b) => b
    ..debugPaintSizeEnabled = true
    ..update(updates));
}
