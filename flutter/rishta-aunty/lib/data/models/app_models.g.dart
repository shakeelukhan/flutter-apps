// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_models.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ConfigModel> _$configModelSerializer = _$ConfigModelSerializer();
Serializer<AppModel> _$appModelSerializer = _$AppModelSerializer();
Serializer<MenuModel> _$menuModelSerializer = _$MenuModelSerializer();
Serializer<MenuItemModel> _$menuItemModelSerializer =
    _$MenuItemModelSerializer();
Serializer<SubmenuModel> _$submenuModelSerializer = _$SubmenuModelSerializer();
Serializer<SubmenuItemModel> _$submenuItemModelSerializer =
    _$SubmenuItemModelSerializer();

class _$ConfigModelSerializer implements StructuredSerializer<ConfigModel> {
  @override
  final Iterable<Type> types = const [ConfigModel, _$ConfigModel];
  @override
  final String wireName = 'ConfigModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, ConfigModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'apps',
      serializers.serialize(object.apps,
          specifiedType: const FullType(BuiltMap, const [
            const FullType(String),
            const FullType(BaseDatasourceModel)
          ])),
    ];

    return result;
  }

  @override
  ConfigModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ConfigModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'apps':
          result.apps.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(BaseDatasourceModel)
              ]))!);
          break;
      }
    }

    return result.build();
  }
}

class _$AppModelSerializer implements StructuredSerializer<AppModel> {
  @override
  final Iterable<Type> types = const [AppModel, _$AppModel];
  @override
  final String wireName = 'AppModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, AppModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'debugPaintPointersEnabled',
      serializers.serialize(object.debugPaintPointersEnabled,
          specifiedType: const FullType(bool)),
      'debugPaintSizeEnabled',
      serializers.serialize(object.debugPaintSizeEnabled,
          specifiedType: const FullType(bool)),
      'debugShowCheckedModeBanner',
      serializers.serialize(object.debugShowCheckedModeBanner,
          specifiedType: const FullType(bool)),
      'showPerformanceOverlay',
      serializers.serialize(object.showPerformanceOverlay,
          specifiedType: const FullType(bool)),
      'showSemanticsDebugger',
      serializers.serialize(object.showSemanticsDebugger,
          specifiedType: const FullType(bool)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'menu',
      serializers.serialize(object.menu,
          specifiedType: const FullType(MenuModel)),
    ];

    return result;
  }

  @override
  AppModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = AppModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'debugPaintPointersEnabled':
          result.debugPaintPointersEnabled = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'debugPaintSizeEnabled':
          result.debugPaintSizeEnabled = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'debugShowCheckedModeBanner':
          result.debugShowCheckedModeBanner = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'showPerformanceOverlay':
          result.showPerformanceOverlay = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'showSemanticsDebugger':
          result.showSemanticsDebugger = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'menu':
          result.menu.replace(serializers.deserialize(value,
              specifiedType: const FullType(MenuModel))! as MenuModel);
          break;
      }
    }

    return result.build();
  }
}

class _$MenuModelSerializer implements StructuredSerializer<MenuModel> {
  @override
  final Iterable<Type> types = const [MenuModel, _$MenuModel];
  @override
  final String wireName = 'MenuModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, MenuModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'activeIndex',
      serializers.serialize(object.activeIndex,
          specifiedType: const FullType(int)),
      'items',
      serializers.serialize(object.items,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(int), const FullType(MenuItemModel)])),
    ];

    return result;
  }

  @override
  MenuModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = MenuModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'activeIndex':
          result.activeIndex = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'items':
          result.items.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(int),
                const FullType(MenuItemModel)
              ]))!);
          break;
      }
    }

    return result.build();
  }
}

class _$MenuItemModelSerializer implements StructuredSerializer<MenuItemModel> {
  @override
  final Iterable<Type> types = const [MenuItemModel, _$MenuItemModel];
  @override
  final String wireName = 'MenuItemModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, MenuItemModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'codePoint',
      serializers.serialize(object.codePoint,
          specifiedType: const FullType(int)),
      'fontFamily',
      serializers.serialize(object.fontFamily,
          specifiedType: const FullType(String)),
      'submenu',
      serializers.serialize(object.submenu,
          specifiedType: const FullType(SubmenuModel)),
    ];

    return result;
  }

  @override
  MenuItemModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = MenuItemModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'codePoint':
          result.codePoint = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'fontFamily':
          result.fontFamily = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'submenu':
          result.submenu.replace(serializers.deserialize(value,
              specifiedType: const FullType(SubmenuModel))! as SubmenuModel);
          break;
      }
    }

    return result.build();
  }
}

class _$SubmenuModelSerializer implements StructuredSerializer<SubmenuModel> {
  @override
  final Iterable<Type> types = const [SubmenuModel, _$SubmenuModel];
  @override
  final String wireName = 'SubmenuModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, SubmenuModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'activeIndex',
      serializers.serialize(object.activeIndex,
          specifiedType: const FullType(int)),
      'items',
      serializers.serialize(object.items,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(int), const FullType(SubmenuItemModel)])),
    ];

    return result;
  }

  @override
  SubmenuModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = SubmenuModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'activeIndex':
          result.activeIndex = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'items':
          result.items.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(int),
                const FullType(SubmenuItemModel)
              ]))!);
          break;
      }
    }

    return result.build();
  }
}

class _$SubmenuItemModelSerializer
    implements StructuredSerializer<SubmenuItemModel> {
  @override
  final Iterable<Type> types = const [SubmenuItemModel, _$SubmenuItemModel];
  @override
  final String wireName = 'SubmenuItemModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, SubmenuItemModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'route',
      serializers.serialize(object.route,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  SubmenuItemModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = SubmenuItemModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'route':
          result.route = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ConfigModel extends ConfigModel {
  @override
  final BuiltMap<String, BaseDatasourceModel> apps;

  factory _$ConfigModel([void Function(ConfigModelBuilder)? updates]) =>
      (ConfigModelBuilder()..update(updates))._build();

  _$ConfigModel._({required this.apps}) : super._();
  @override
  ConfigModel rebuild(void Function(ConfigModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfigModelBuilder toBuilder() => ConfigModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfigModel && apps == other.apps;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, apps.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConfigModel')..add('apps', apps))
        .toString();
  }
}

class ConfigModelBuilder implements Builder<ConfigModel, ConfigModelBuilder> {
  _$ConfigModel? _$v;

  MapBuilder<String, BaseDatasourceModel>? _apps;
  MapBuilder<String, BaseDatasourceModel> get apps =>
      _$this._apps ??= MapBuilder<String, BaseDatasourceModel>();
  set apps(MapBuilder<String, BaseDatasourceModel>? apps) =>
      _$this._apps = apps;

  ConfigModelBuilder();

  ConfigModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _apps = $v.apps.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConfigModel other) {
    _$v = other as _$ConfigModel;
  }

  @override
  void update(void Function(ConfigModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConfigModel build() => _build();

  _$ConfigModel _build() {
    _$ConfigModel _$result;
    try {
      _$result = _$v ??
          _$ConfigModel._(
            apps: apps.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'apps';
        apps.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ConfigModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$AppModel extends AppModel {
  @override
  final bool debugPaintPointersEnabled;
  @override
  final bool debugPaintSizeEnabled;
  @override
  final bool debugShowCheckedModeBanner;
  @override
  final bool showPerformanceOverlay;
  @override
  final bool showSemanticsDebugger;
  @override
  final String title;
  @override
  final MenuModel menu;

  factory _$AppModel([void Function(AppModelBuilder)? updates]) =>
      (AppModelBuilder()..update(updates))._build();

  _$AppModel._(
      {required this.debugPaintPointersEnabled,
      required this.debugPaintSizeEnabled,
      required this.debugShowCheckedModeBanner,
      required this.showPerformanceOverlay,
      required this.showSemanticsDebugger,
      required this.title,
      required this.menu})
      : super._();
  @override
  AppModel rebuild(void Function(AppModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppModelBuilder toBuilder() => AppModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppModel &&
        debugPaintPointersEnabled == other.debugPaintPointersEnabled &&
        debugPaintSizeEnabled == other.debugPaintSizeEnabled &&
        debugShowCheckedModeBanner == other.debugShowCheckedModeBanner &&
        showPerformanceOverlay == other.showPerformanceOverlay &&
        showSemanticsDebugger == other.showSemanticsDebugger &&
        title == other.title &&
        menu == other.menu;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, debugPaintPointersEnabled.hashCode);
    _$hash = $jc(_$hash, debugPaintSizeEnabled.hashCode);
    _$hash = $jc(_$hash, debugShowCheckedModeBanner.hashCode);
    _$hash = $jc(_$hash, showPerformanceOverlay.hashCode);
    _$hash = $jc(_$hash, showSemanticsDebugger.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, menu.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppModel')
          ..add('debugPaintPointersEnabled', debugPaintPointersEnabled)
          ..add('debugPaintSizeEnabled', debugPaintSizeEnabled)
          ..add('debugShowCheckedModeBanner', debugShowCheckedModeBanner)
          ..add('showPerformanceOverlay', showPerformanceOverlay)
          ..add('showSemanticsDebugger', showSemanticsDebugger)
          ..add('title', title)
          ..add('menu', menu))
        .toString();
  }
}

class AppModelBuilder implements Builder<AppModel, AppModelBuilder> {
  _$AppModel? _$v;

  bool? _debugPaintPointersEnabled;
  bool? get debugPaintPointersEnabled => _$this._debugPaintPointersEnabled;
  set debugPaintPointersEnabled(bool? debugPaintPointersEnabled) =>
      _$this._debugPaintPointersEnabled = debugPaintPointersEnabled;

  bool? _debugPaintSizeEnabled;
  bool? get debugPaintSizeEnabled => _$this._debugPaintSizeEnabled;
  set debugPaintSizeEnabled(bool? debugPaintSizeEnabled) =>
      _$this._debugPaintSizeEnabled = debugPaintSizeEnabled;

  bool? _debugShowCheckedModeBanner;
  bool? get debugShowCheckedModeBanner => _$this._debugShowCheckedModeBanner;
  set debugShowCheckedModeBanner(bool? debugShowCheckedModeBanner) =>
      _$this._debugShowCheckedModeBanner = debugShowCheckedModeBanner;

  bool? _showPerformanceOverlay;
  bool? get showPerformanceOverlay => _$this._showPerformanceOverlay;
  set showPerformanceOverlay(bool? showPerformanceOverlay) =>
      _$this._showPerformanceOverlay = showPerformanceOverlay;

  bool? _showSemanticsDebugger;
  bool? get showSemanticsDebugger => _$this._showSemanticsDebugger;
  set showSemanticsDebugger(bool? showSemanticsDebugger) =>
      _$this._showSemanticsDebugger = showSemanticsDebugger;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  MenuModelBuilder? _menu;
  MenuModelBuilder get menu => _$this._menu ??= MenuModelBuilder();
  set menu(MenuModelBuilder? menu) => _$this._menu = menu;

  AppModelBuilder() {
    AppModel._initializeBuilder(this);
  }

  AppModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _debugPaintPointersEnabled = $v.debugPaintPointersEnabled;
      _debugPaintSizeEnabled = $v.debugPaintSizeEnabled;
      _debugShowCheckedModeBanner = $v.debugShowCheckedModeBanner;
      _showPerformanceOverlay = $v.showPerformanceOverlay;
      _showSemanticsDebugger = $v.showSemanticsDebugger;
      _title = $v.title;
      _menu = $v.menu.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppModel other) {
    _$v = other as _$AppModel;
  }

  @override
  void update(void Function(AppModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppModel build() => _build();

  _$AppModel _build() {
    _$AppModel _$result;
    try {
      _$result = _$v ??
          _$AppModel._(
            debugPaintPointersEnabled: BuiltValueNullFieldError.checkNotNull(
                debugPaintPointersEnabled,
                r'AppModel',
                'debugPaintPointersEnabled'),
            debugPaintSizeEnabled: BuiltValueNullFieldError.checkNotNull(
                debugPaintSizeEnabled, r'AppModel', 'debugPaintSizeEnabled'),
            debugShowCheckedModeBanner: BuiltValueNullFieldError.checkNotNull(
                debugShowCheckedModeBanner,
                r'AppModel',
                'debugShowCheckedModeBanner'),
            showPerformanceOverlay: BuiltValueNullFieldError.checkNotNull(
                showPerformanceOverlay, r'AppModel', 'showPerformanceOverlay'),
            showSemanticsDebugger: BuiltValueNullFieldError.checkNotNull(
                showSemanticsDebugger, r'AppModel', 'showSemanticsDebugger'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'AppModel', 'title'),
            menu: menu.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'menu';
        menu.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AppModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$MenuModel extends MenuModel {
  @override
  final int activeIndex;
  @override
  final BuiltMap<int, MenuItemModel> items;

  factory _$MenuModel([void Function(MenuModelBuilder)? updates]) =>
      (MenuModelBuilder()..update(updates))._build();

  _$MenuModel._({required this.activeIndex, required this.items}) : super._();
  @override
  MenuModel rebuild(void Function(MenuModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MenuModelBuilder toBuilder() => MenuModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MenuModel &&
        activeIndex == other.activeIndex &&
        items == other.items;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, activeIndex.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MenuModel')
          ..add('activeIndex', activeIndex)
          ..add('items', items))
        .toString();
  }
}

class MenuModelBuilder implements Builder<MenuModel, MenuModelBuilder> {
  _$MenuModel? _$v;

  int? _activeIndex;
  int? get activeIndex => _$this._activeIndex;
  set activeIndex(int? activeIndex) => _$this._activeIndex = activeIndex;

  MapBuilder<int, MenuItemModel>? _items;
  MapBuilder<int, MenuItemModel> get items =>
      _$this._items ??= MapBuilder<int, MenuItemModel>();
  set items(MapBuilder<int, MenuItemModel>? items) => _$this._items = items;

  MenuModelBuilder() {
    MenuModel._initializeBuilder(this);
  }

  MenuModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _activeIndex = $v.activeIndex;
      _items = $v.items.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MenuModel other) {
    _$v = other as _$MenuModel;
  }

  @override
  void update(void Function(MenuModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MenuModel build() => _build();

  _$MenuModel _build() {
    _$MenuModel _$result;
    try {
      _$result = _$v ??
          _$MenuModel._(
            activeIndex: BuiltValueNullFieldError.checkNotNull(
                activeIndex, r'MenuModel', 'activeIndex'),
            items: items.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'MenuModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$MenuItemModel extends MenuItemModel {
  @override
  final String title;
  @override
  final int codePoint;
  @override
  final String fontFamily;
  @override
  final SubmenuModel submenu;

  factory _$MenuItemModel([void Function(MenuItemModelBuilder)? updates]) =>
      (MenuItemModelBuilder()..update(updates))._build();

  _$MenuItemModel._(
      {required this.title,
      required this.codePoint,
      required this.fontFamily,
      required this.submenu})
      : super._();
  @override
  MenuItemModel rebuild(void Function(MenuItemModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MenuItemModelBuilder toBuilder() => MenuItemModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MenuItemModel &&
        title == other.title &&
        codePoint == other.codePoint &&
        fontFamily == other.fontFamily &&
        submenu == other.submenu;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, codePoint.hashCode);
    _$hash = $jc(_$hash, fontFamily.hashCode);
    _$hash = $jc(_$hash, submenu.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MenuItemModel')
          ..add('title', title)
          ..add('codePoint', codePoint)
          ..add('fontFamily', fontFamily)
          ..add('submenu', submenu))
        .toString();
  }
}

class MenuItemModelBuilder
    implements Builder<MenuItemModel, MenuItemModelBuilder> {
  _$MenuItemModel? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  int? _codePoint;
  int? get codePoint => _$this._codePoint;
  set codePoint(int? codePoint) => _$this._codePoint = codePoint;

  String? _fontFamily;
  String? get fontFamily => _$this._fontFamily;
  set fontFamily(String? fontFamily) => _$this._fontFamily = fontFamily;

  SubmenuModelBuilder? _submenu;
  SubmenuModelBuilder get submenu => _$this._submenu ??= SubmenuModelBuilder();
  set submenu(SubmenuModelBuilder? submenu) => _$this._submenu = submenu;

  MenuItemModelBuilder() {
    MenuItemModel._initializeBuilder(this);
  }

  MenuItemModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _codePoint = $v.codePoint;
      _fontFamily = $v.fontFamily;
      _submenu = $v.submenu.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MenuItemModel other) {
    _$v = other as _$MenuItemModel;
  }

  @override
  void update(void Function(MenuItemModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MenuItemModel build() => _build();

  _$MenuItemModel _build() {
    _$MenuItemModel _$result;
    try {
      _$result = _$v ??
          _$MenuItemModel._(
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'MenuItemModel', 'title'),
            codePoint: BuiltValueNullFieldError.checkNotNull(
                codePoint, r'MenuItemModel', 'codePoint'),
            fontFamily: BuiltValueNullFieldError.checkNotNull(
                fontFamily, r'MenuItemModel', 'fontFamily'),
            submenu: submenu.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'submenu';
        submenu.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'MenuItemModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$SubmenuModel extends SubmenuModel {
  @override
  final int activeIndex;
  @override
  final BuiltMap<int, SubmenuItemModel> items;

  factory _$SubmenuModel([void Function(SubmenuModelBuilder)? updates]) =>
      (SubmenuModelBuilder()..update(updates))._build();

  _$SubmenuModel._({required this.activeIndex, required this.items})
      : super._();
  @override
  SubmenuModel rebuild(void Function(SubmenuModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubmenuModelBuilder toBuilder() => SubmenuModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubmenuModel &&
        activeIndex == other.activeIndex &&
        items == other.items;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, activeIndex.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SubmenuModel')
          ..add('activeIndex', activeIndex)
          ..add('items', items))
        .toString();
  }
}

class SubmenuModelBuilder
    implements Builder<SubmenuModel, SubmenuModelBuilder> {
  _$SubmenuModel? _$v;

  int? _activeIndex;
  int? get activeIndex => _$this._activeIndex;
  set activeIndex(int? activeIndex) => _$this._activeIndex = activeIndex;

  MapBuilder<int, SubmenuItemModel>? _items;
  MapBuilder<int, SubmenuItemModel> get items =>
      _$this._items ??= MapBuilder<int, SubmenuItemModel>();
  set items(MapBuilder<int, SubmenuItemModel>? items) => _$this._items = items;

  SubmenuModelBuilder() {
    SubmenuModel._initializeBuilder(this);
  }

  SubmenuModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _activeIndex = $v.activeIndex;
      _items = $v.items.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubmenuModel other) {
    _$v = other as _$SubmenuModel;
  }

  @override
  void update(void Function(SubmenuModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SubmenuModel build() => _build();

  _$SubmenuModel _build() {
    _$SubmenuModel _$result;
    try {
      _$result = _$v ??
          _$SubmenuModel._(
            activeIndex: BuiltValueNullFieldError.checkNotNull(
                activeIndex, r'SubmenuModel', 'activeIndex'),
            items: items.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'SubmenuModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$SubmenuItemModel extends SubmenuItemModel {
  @override
  final String title;
  @override
  final String route;

  factory _$SubmenuItemModel(
          [void Function(SubmenuItemModelBuilder)? updates]) =>
      (SubmenuItemModelBuilder()..update(updates))._build();

  _$SubmenuItemModel._({required this.title, required this.route}) : super._();
  @override
  SubmenuItemModel rebuild(void Function(SubmenuItemModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubmenuItemModelBuilder toBuilder() =>
      SubmenuItemModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubmenuItemModel &&
        title == other.title &&
        route == other.route;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, route.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SubmenuItemModel')
          ..add('title', title)
          ..add('route', route))
        .toString();
  }
}

class SubmenuItemModelBuilder
    implements Builder<SubmenuItemModel, SubmenuItemModelBuilder> {
  _$SubmenuItemModel? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _route;
  String? get route => _$this._route;
  set route(String? route) => _$this._route = route;

  SubmenuItemModelBuilder() {
    SubmenuItemModel._initializeBuilder(this);
  }

  SubmenuItemModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _route = $v.route;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubmenuItemModel other) {
    _$v = other as _$SubmenuItemModel;
  }

  @override
  void update(void Function(SubmenuItemModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SubmenuItemModel build() => _build();

  _$SubmenuItemModel _build() {
    final _$result = _$v ??
        _$SubmenuItemModel._(
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'SubmenuItemModel', 'title'),
          route: BuiltValueNullFieldError.checkNotNull(
              route, r'SubmenuItemModel', 'route'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
