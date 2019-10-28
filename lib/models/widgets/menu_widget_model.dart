import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '../widget_model.dart';
part 'menu_widget_model.g.dart';

abstract class MenuWidgetModel extends WidgetModel
    implements Built<MenuWidgetModel, MenuWidgetModelBuilder> {
  static Serializer<MenuWidgetModel> get serializer =>
      _$menuWidgetModelSerializer;

  String get title;

  int get codePoint;

  String get fontFamily;

  MenuWidgetModel._();
  factory MenuWidgetModel([updates(MenuWidgetModelBuilder b)]) = _$MenuWidgetModel;
}
