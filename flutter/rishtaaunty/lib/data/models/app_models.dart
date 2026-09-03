import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rishtaaunty/data/data.dart';
import 'package:rishtaaunty/tools/tools.dart' as t;
import 'base_model.dart';
part 'app_models.g.dart';

abstract class ConfigModel extends BaseModel<ConfigModel>
    implements Built<ConfigModel, ConfigModelBuilder> {
  static Serializer<ConfigModel> get serializer => _$configModelSerializer;

  BuiltMap<String, BaseDatasourceModel> get apps;

  ConfigModel._();
  factory ConfigModel([void Function(ConfigModelBuilder)? updates]) =
      _$ConfigModel;
  factory ConfigModel.fromJson(Map json) =>
      t.builtValue.deserialize(json, FullType(ConfigModel)) as ConfigModel;
}

abstract class AppModel extends BaseModel<AppModel>
    implements Built<AppModel, AppModelBuilder> {
  static void _initializeBuilder(AppModelBuilder b) => b
    ..debugPaintPointersEnabled = false
    ..debugPaintSizeEnabled = false
    ..debugShowCheckedModeBanner = false
    ..showPerformanceOverlay = false
    ..showSemanticsDebugger = false
    ..title = ''
    ..menu = MenuModel().toBuilder();
  static Serializer<AppModel> get serializer => _$appModelSerializer;

  bool get debugPaintPointersEnabled;
  bool get debugPaintSizeEnabled;
  bool get debugShowCheckedModeBanner;
  bool get showPerformanceOverlay;
  bool get showSemanticsDebugger;
  String get title;
  MenuModel get menu;

  AppModel._();
  factory AppModel([void Function(AppModelBuilder)? updates]) = _$AppModel;
  factory AppModel.fromJson(Map json) =>
      t.builtValue.deserialize(json, FullType(AppModel)) as AppModel;
}

abstract class MenuModel extends BaseModel<MenuModel>
    implements Built<MenuModel, MenuModelBuilder> {
  static Serializer<MenuModel> get serializer => _$menuModelSerializer;
  static void _initializeBuilder(MenuModelBuilder b) => b
    ..activeIndex = 0
    ..items = BuiltMap<int, MenuItemModel>({}).toBuilder();

  int get activeIndex;
  BuiltMap<int, MenuItemModel> get items;

  MenuModel._();
  factory MenuModel([void Function(MenuModelBuilder)? updates]) = _$MenuModel;
  factory MenuModel.fromJson(Map json) =>
      t.builtValue.deserialize(json, FullType(MenuModel)) as MenuModel;
}

abstract class MenuItemModel extends BaseModel<MenuItemModel>
    implements Built<MenuItemModel, MenuItemModelBuilder> {
  static Serializer<MenuItemModel> get serializer => _$menuItemModelSerializer;
  static void _initializeBuilder(MenuItemModelBuilder b) => b
    ..title = ''
    ..codePoint = 0
    ..fontFamily = 'MaterialIcons'
    ..submenu = SubmenuModel().toBuilder();

  String get title;
  int get codePoint;
  String get fontFamily;
  SubmenuModel get submenu;

  MenuItemModel._();
  factory MenuItemModel([void Function(MenuItemModelBuilder)? updates]) =
      _$MenuItemModel;
  factory MenuItemModel.fromJson(Map json) =>
      t.builtValue.deserialize(json, FullType(MenuItemModel)) as MenuItemModel;
}

abstract class SubmenuModel extends BaseModel<SubmenuModel>
    implements Built<SubmenuModel, SubmenuModelBuilder> {
  static Serializer<SubmenuModel> get serializer => _$submenuModelSerializer;
  static void _initializeBuilder(SubmenuModelBuilder b) => b
    ..activeIndex = 0
    ..items = BuiltMap<int, SubmenuItemModel>({}).toBuilder();

  int get activeIndex;
  BuiltMap<int, SubmenuItemModel> get items;

  SubmenuModel._();
  factory SubmenuModel([void Function(SubmenuModelBuilder)? updates]) =
      _$SubmenuModel;
  factory SubmenuModel.fromJson(Map json) =>
      t.builtValue.deserialize(json, FullType(SubmenuModel)) as SubmenuModel;
}

abstract class SubmenuItemModel extends BaseModel<SubmenuItemModel>
    implements Built<SubmenuItemModel, SubmenuItemModelBuilder> {
  static Serializer<SubmenuItemModel> get serializer =>
      _$submenuItemModelSerializer;
  static void _initializeBuilder(SubmenuItemModelBuilder b) => b
    ..title = ''
    ..route = '/null/route';

  String get title;
  String get route;

  SubmenuItemModel._();
  factory SubmenuItemModel([void Function(SubmenuItemModelBuilder)? updates]) =
      _$SubmenuItemModel;
  factory SubmenuItemModel.fromJson(Map json) =>
      t.builtValue.deserialize(json, FullType(SubmenuItemModel)) as SubmenuItemModel;
}
