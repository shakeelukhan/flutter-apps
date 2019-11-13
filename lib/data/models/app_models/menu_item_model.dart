import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rishtaaunty/tools/tools.dart' as t;
import '../base_model.dart';
part 'menu_item_model.g.dart';

abstract class MenuItemModel extends BaseModel<MenuItemModel>
    implements Built<MenuItemModel, MenuItemModelBuilder> {
  static Serializer<MenuItemModel> get serializer => _$menuItemModelSerializer;
  static void _initializeBuilder(MenuItemModelBuilder b) => b
    ..title = 'TAB' // default: TAB
    ..codePoint = 59530 // default: 0xe87d
    ..fontFamily = 'MaterialIcons'; // default: MaterialIcons

  String get title;
  int get codePoint;
  String get fontFamily;

  MenuItemModel._();
  factory MenuItemModel([void Function(MenuItemModelBuilder) updates]) =
      _$MenuItemModel;
  static MenuItemModel fromJson(Map json) =>
      t.io.deserialize(json, FullType(MenuItemModel));
}
