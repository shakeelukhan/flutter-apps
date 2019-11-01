import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'base_widget_model.dart';
part 'menu_widget_model.g.dart';

abstract class MenuWidgetModel extends BaseWidgetModel
    implements Built<MenuWidgetModel, MenuWidgetModelBuilder> {
  // default: TAB
  @nullable
  String get title;

  // default: 0xe87d
  @nullable
  int get codePoint;

  // default: MaterialIcons
  @nullable
  String get fontFamily;

  MenuWidgetModel._();
  factory MenuWidgetModel([updates(MenuWidgetModelBuilder b)]) =
      _$MenuWidgetModel;

  static Serializer<MenuWidgetModel> get serializer =>
      _$menuWidgetModelSerializer;
}
