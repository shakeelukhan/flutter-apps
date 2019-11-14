import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rishtaaunty/tools/tools.dart' as t;
import '../base_model.dart';
part 'sub_menu_item_model.g.dart';

abstract class SubMenuItemModel extends BaseModel<SubMenuItemModel>
    implements Built<SubMenuItemModel, SubMenuItemModelBuilder> {
  static Serializer<SubMenuItemModel> get serializer =>
      _$subMenuItemModelSerializer;
  static void _initializeBuilder(SubMenuItemModelBuilder b) => b
    ..title = 'NULL_S'
    ..route = '/null/route';

  String get title;
  String get route;

  SubMenuItemModel._();
  factory SubMenuItemModel([void Function(SubMenuItemModelBuilder) updates]) =
      _$SubMenuItemModel;
  static SubMenuItemModel fromJson(Map json) =>
      t.io.deserialize(json, FullType(SubMenuItemModel));
}
