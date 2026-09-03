// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_models.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ConfigModel> _$configModelSerializer = new _$ConfigModelSerializer();
Serializer<AppModel> _$appModelSerializer = new _$AppModelSerializer();
Serializer<MenuModel> _$menuModelSerializer = new _$MenuModelSerializer();
Serializer<MenuItemModel> _$menuItemModelSerializer =
    new _$MenuItemModelSerializer();
Serializer<SubmenuModel> _$submenuModelSerializer =
    new _$SubmenuModelSerializer();
Serializer<SubmenuItemModel> _$submenuItemModelSerializer =
    new _$SubmenuItemModelSerializer();

class _$ConfigModelSerializer implements StructuredSerializer<ConfigModel> {
  @override
  final Iterable<Type> types = const [ConfigModel, _$ConfigModel];
  @override
  final String wireName = 'ConfigModel';

  @override
  Iterable<Object> serialize(Serializers serializers, ConfigModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
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
  ConfigModel deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConfigModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'apps':
          result.apps.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(BaseDatasourceModel)
              ])) as BuiltMap<dynamic, dynamic>);
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
  Iterable<Object> serialize(Serializers serializers, AppModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
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
  AppModel deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'debugPaintPointersEnabled':
          result.debugPaintPointersEnabled = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'debugPaintSizeEnabled':
          result.debugPaintSizeEnabled = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'debugShowCheckedModeBanner':
          result.debugShowCheckedModeBanner = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'showPerformanceOverlay':
          result.showPerformanceOverlay = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'showSemanticsDebugger':
          result.showSemanticsDebugger = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'menu':
          result.menu.replace(serializers.deserialize(value,
              specifiedType: const FullType(MenuModel)) as MenuModel);
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
  Iterable<Object> serialize(Serializers serializers, MenuModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
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
  MenuModel deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MenuModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'activeIndex':
          result.activeIndex = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'items':
          result.items.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(int),
                const FullType(MenuItemModel)
              ])) as BuiltMap<dynamic, dynamic>);
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
  Iterable<Object> serialize(Serializers serializers, MenuItemModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
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
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MenuItemModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'codePoint':
          result.codePoint = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'fontFamily':
          result.fontFamily = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'submenu':
          result.submenu.replace(serializers.deserialize(value,
              specifiedType: const FullType(SubmenuModel)) as SubmenuModel);
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
  Iterable<Object> serialize(Serializers serializers, SubmenuModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
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
  SubmenuModel deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SubmenuModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'activeIndex':
          result.activeIndex = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'items':
          result.items.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(int),
                const FullType(SubmenuItemModel)
              ])) as BuiltMap<dynamic, dynamic>);
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
  Iterable<Object> serialize(Serializers serializers, SubmenuItemModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
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
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SubmenuItemModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'route':
          result.route = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ConfigModel extends ConfigModel {
  @override
  final BuiltMap<String, BaseDatasourceModel> apps;

  factory _$ConfigModel([void Function(ConfigModelBuilder) updates]) =>
      (new ConfigModelBuilder()..update(updates)).build();

  _$ConfigModel._({this.apps}) : super._() {
    if (apps == null) {
      throw new BuiltValueNullFieldError('ConfigModel', 'apps');
    }
  }

  @override
  ConfigModel rebuild(void Function(ConfigModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfigModelBuilder toBuilder() => new ConfigModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfigModel && apps == other.apps;
  }

  @override
  int get hashCode {
    return $jf($jc(0, apps.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ConfigModel')..add('apps', apps))
        .toString();
  }
}

class ConfigModelBuilder implements Builder<ConfigModel, ConfigModelBuilder> {
  _$ConfigModel _$v;

  MapBuilder<String, BaseDatasourceModel> _apps;
  MapBuilder<String, BaseDatasourceModel> get apps =>
      _$this._apps ??= new MapBuilder<String, BaseDatasourceModel>();
  set apps(MapBuilder<String, BaseDatasourceModel> apps) => _$this._apps = apps;

  ConfigModelBuilder();

  ConfigModelBuilder get _$this {
    if (_$v != null) {
      _apps = _$v.apps?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConfigModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ConfigModel;
  }

  @override
  void update(void Function(ConfigModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ConfigModel build() {
    _$ConfigModel _$result;
    try {
      _$result = _$v ?? new _$ConfigModel._(apps: apps.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'apps';
        apps.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ConfigModel', _$failedField, e.toString());
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

  factory _$AppModel([void Function(AppModelBuilder) updates]) =>
      (new AppModelBuilder()..update(updates)).build();

  _$AppModel._(
      {this.debugPaintPointersEnabled,
      this.debugPaintSizeEnabled,
      this.debugShowCheckedModeBanner,
      this.showPerformanceOverlay,
      this.showSemanticsDebugger,
      this.title,
      this.menu})
      : super._() {
    if (debugPaintPointersEnabled == null) {
      throw new BuiltValueNullFieldError(
          'AppModel', 'debugPaintPointersEnabled');
    }
    if (debugPaintSizeEnabled == null) {
      throw new BuiltValueNullFieldError('AppModel', 'debugPaintSizeEnabled');
    }
    if (debugShowCheckedModeBanner == null) {
      throw new BuiltValueNullFieldError(
          'AppModel', 'debugShowCheckedModeBanner');
    }
    if (showPerformanceOverlay == null) {
      throw new BuiltValueNullFieldError('AppModel', 'showPerformanceOverlay');
    }
    if (showSemanticsDebugger == null) {
      throw new BuiltValueNullFieldError('AppModel', 'showSemanticsDebugger');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('AppModel', 'title');
    }
    if (menu == null) {
      throw new BuiltValueNullFieldError('AppModel', 'menu');
    }
  }

  @override
  AppModel rebuild(void Function(AppModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppModelBuilder toBuilder() => new AppModelBuilder()..replace(this);

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
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc(0, debugPaintPointersEnabled.hashCode),
                            debugPaintSizeEnabled.hashCode),
                        debugShowCheckedModeBanner.hashCode),
                    showPerformanceOverlay.hashCode),
                showSemanticsDebugger.hashCode),
            title.hashCode),
        menu.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppModel')
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
  _$AppModel _$v;

  bool _debugPaintPointersEnabled;
  bool get debugPaintPointersEnabled => _$this._debugPaintPointersEnabled;
  set debugPaintPointersEnabled(bool debugPaintPointersEnabled) =>
      _$this._debugPaintPointersEnabled = debugPaintPointersEnabled;

  bool _debugPaintSizeEnabled;
  bool get debugPaintSizeEnabled => _$this._debugPaintSizeEnabled;
  set debugPaintSizeEnabled(bool debugPaintSizeEnabled) =>
      _$this._debugPaintSizeEnabled = debugPaintSizeEnabled;

  bool _debugShowCheckedModeBanner;
  bool get debugShowCheckedModeBanner => _$this._debugShowCheckedModeBanner;
  set debugShowCheckedModeBanner(bool debugShowCheckedModeBanner) =>
      _$this._debugShowCheckedModeBanner = debugShowCheckedModeBanner;

  bool _showPerformanceOverlay;
  bool get showPerformanceOverlay => _$this._showPerformanceOverlay;
  set showPerformanceOverlay(bool showPerformanceOverlay) =>
      _$this._showPerformanceOverlay = showPerformanceOverlay;

  bool _showSemanticsDebugger;
  bool get showSemanticsDebugger => _$this._showSemanticsDebugger;
  set showSemanticsDebugger(bool showSemanticsDebugger) =>
      _$this._showSemanticsDebugger = showSemanticsDebugger;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  MenuModelBuilder _menu;
  MenuModelBuilder get menu => _$this._menu ??= new MenuModelBuilder();
  set menu(MenuModelBuilder menu) => _$this._menu = menu;

  AppModelBuilder() {
    AppModel._initializeBuilder(this);
  }

  AppModelBuilder get _$this {
    if (_$v != null) {
      _debugPaintPointersEnabled = _$v.debugPaintPointersEnabled;
      _debugPaintSizeEnabled = _$v.debugPaintSizeEnabled;
      _debugShowCheckedModeBanner = _$v.debugShowCheckedModeBanner;
      _showPerformanceOverlay = _$v.showPerformanceOverlay;
      _showSemanticsDebugger = _$v.showSemanticsDebugger;
      _title = _$v.title;
      _menu = _$v.menu?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppModel;
  }

  @override
  void update(void Function(AppModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppModel build() {
    _$AppModel _$result;
    try {
      _$result = _$v ??
          new _$AppModel._(
              debugPaintPointersEnabled: debugPaintPointersEnabled,
              debugPaintSizeEnabled: debugPaintSizeEnabled,
              debugShowCheckedModeBanner: debugShowCheckedModeBanner,
              showPerformanceOverlay: showPerformanceOverlay,
              showSemanticsDebugger: showSemanticsDebugger,
              title: title,
              menu: menu.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'menu';
        menu.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppModel', _$failedField, e.toString());
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

  factory _$MenuModel([void Function(MenuModelBuilder) updates]) =>
      (new MenuModelBuilder()..update(updates)).build();

  _$MenuModel._({this.activeIndex, this.items}) : super._() {
    if (activeIndex == null) {
      throw new BuiltValueNullFieldError('MenuModel', 'activeIndex');
    }
    if (items == null) {
      throw new BuiltValueNullFieldError('MenuModel', 'items');
    }
  }

  @override
  MenuModel rebuild(void Function(MenuModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MenuModelBuilder toBuilder() => new MenuModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MenuModel &&
        activeIndex == other.activeIndex &&
        items == other.items;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, activeIndex.hashCode), items.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MenuModel')
          ..add('activeIndex', activeIndex)
          ..add('items', items))
        .toString();
  }
}

class MenuModelBuilder implements Builder<MenuModel, MenuModelBuilder> {
  _$MenuModel _$v;

  int _activeIndex;
  int get activeIndex => _$this._activeIndex;
  set activeIndex(int activeIndex) => _$this._activeIndex = activeIndex;

  MapBuilder<int, MenuItemModel> _items;
  MapBuilder<int, MenuItemModel> get items =>
      _$this._items ??= new MapBuilder<int, MenuItemModel>();
  set items(MapBuilder<int, MenuItemModel> items) => _$this._items = items;

  MenuModelBuilder() {
    MenuModel._initializeBuilder(this);
  }

  MenuModelBuilder get _$this {
    if (_$v != null) {
      _activeIndex = _$v.activeIndex;
      _items = _$v.items?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MenuModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MenuModel;
  }

  @override
  void update(void Function(MenuModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MenuModel build() {
    _$MenuModel _$result;
    try {
      _$result = _$v ??
          new _$MenuModel._(activeIndex: activeIndex, items: items.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MenuModel', _$failedField, e.toString());
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

  factory _$MenuItemModel([void Function(MenuItemModelBuilder) updates]) =>
      (new MenuItemModelBuilder()..update(updates)).build();

  _$MenuItemModel._({this.title, this.codePoint, this.fontFamily, this.submenu})
      : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('MenuItemModel', 'title');
    }
    if (codePoint == null) {
      throw new BuiltValueNullFieldError('MenuItemModel', 'codePoint');
    }
    if (fontFamily == null) {
      throw new BuiltValueNullFieldError('MenuItemModel', 'fontFamily');
    }
    if (submenu == null) {
      throw new BuiltValueNullFieldError('MenuItemModel', 'submenu');
    }
  }

  @override
  MenuItemModel rebuild(void Function(MenuItemModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MenuItemModelBuilder toBuilder() => new MenuItemModelBuilder()..replace(this);

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
    return $jf($jc(
        $jc($jc($jc(0, title.hashCode), codePoint.hashCode),
            fontFamily.hashCode),
        submenu.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MenuItemModel')
          ..add('title', title)
          ..add('codePoint', codePoint)
          ..add('fontFamily', fontFamily)
          ..add('submenu', submenu))
        .toString();
  }
}

class MenuItemModelBuilder
    implements Builder<MenuItemModel, MenuItemModelBuilder> {
  _$MenuItemModel _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  int _codePoint;
  int get codePoint => _$this._codePoint;
  set codePoint(int codePoint) => _$this._codePoint = codePoint;

  String _fontFamily;
  String get fontFamily => _$this._fontFamily;
  set fontFamily(String fontFamily) => _$this._fontFamily = fontFamily;

  SubmenuModelBuilder _submenu;
  SubmenuModelBuilder get submenu =>
      _$this._submenu ??= new SubmenuModelBuilder();
  set submenu(SubmenuModelBuilder submenu) => _$this._submenu = submenu;

  MenuItemModelBuilder() {
    MenuItemModel._initializeBuilder(this);
  }

  MenuItemModelBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _codePoint = _$v.codePoint;
      _fontFamily = _$v.fontFamily;
      _submenu = _$v.submenu?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MenuItemModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MenuItemModel;
  }

  @override
  void update(void Function(MenuItemModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MenuItemModel build() {
    _$MenuItemModel _$result;
    try {
      _$result = _$v ??
          new _$MenuItemModel._(
              title: title,
              codePoint: codePoint,
              fontFamily: fontFamily,
              submenu: submenu.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'submenu';
        submenu.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MenuItemModel', _$failedField, e.toString());
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

  factory _$SubmenuModel([void Function(SubmenuModelBuilder) updates]) =>
      (new SubmenuModelBuilder()..update(updates)).build();

  _$SubmenuModel._({this.activeIndex, this.items}) : super._() {
    if (activeIndex == null) {
      throw new BuiltValueNullFieldError('SubmenuModel', 'activeIndex');
    }
    if (items == null) {
      throw new BuiltValueNullFieldError('SubmenuModel', 'items');
    }
  }

  @override
  SubmenuModel rebuild(void Function(SubmenuModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubmenuModelBuilder toBuilder() => new SubmenuModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubmenuModel &&
        activeIndex == other.activeIndex &&
        items == other.items;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, activeIndex.hashCode), items.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SubmenuModel')
          ..add('activeIndex', activeIndex)
          ..add('items', items))
        .toString();
  }
}

class SubmenuModelBuilder
    implements Builder<SubmenuModel, SubmenuModelBuilder> {
  _$SubmenuModel _$v;

  int _activeIndex;
  int get activeIndex => _$this._activeIndex;
  set activeIndex(int activeIndex) => _$this._activeIndex = activeIndex;

  MapBuilder<int, SubmenuItemModel> _items;
  MapBuilder<int, SubmenuItemModel> get items =>
      _$this._items ??= new MapBuilder<int, SubmenuItemModel>();
  set items(MapBuilder<int, SubmenuItemModel> items) => _$this._items = items;

  SubmenuModelBuilder() {
    SubmenuModel._initializeBuilder(this);
  }

  SubmenuModelBuilder get _$this {
    if (_$v != null) {
      _activeIndex = _$v.activeIndex;
      _items = _$v.items?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubmenuModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SubmenuModel;
  }

  @override
  void update(void Function(SubmenuModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SubmenuModel build() {
    _$SubmenuModel _$result;
    try {
      _$result = _$v ??
          new _$SubmenuModel._(activeIndex: activeIndex, items: items.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SubmenuModel', _$failedField, e.toString());
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
          [void Function(SubmenuItemModelBuilder) updates]) =>
      (new SubmenuItemModelBuilder()..update(updates)).build();

  _$SubmenuItemModel._({this.title, this.route}) : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('SubmenuItemModel', 'title');
    }
    if (route == null) {
      throw new BuiltValueNullFieldError('SubmenuItemModel', 'route');
    }
  }

  @override
  SubmenuItemModel rebuild(void Function(SubmenuItemModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubmenuItemModelBuilder toBuilder() =>
      new SubmenuItemModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubmenuItemModel &&
        title == other.title &&
        route == other.route;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, title.hashCode), route.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SubmenuItemModel')
          ..add('title', title)
          ..add('route', route))
        .toString();
  }
}

class SubmenuItemModelBuilder
    implements Builder<SubmenuItemModel, SubmenuItemModelBuilder> {
  _$SubmenuItemModel _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _route;
  String get route => _$this._route;
  set route(String route) => _$this._route = route;

  SubmenuItemModelBuilder() {
    SubmenuItemModel._initializeBuilder(this);
  }

  SubmenuItemModelBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _route = _$v.route;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubmenuItemModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SubmenuItemModel;
  }

  @override
  void update(void Function(SubmenuItemModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SubmenuItemModel build() {
    final _$result =
        _$v ?? new _$SubmenuItemModel._(title: title, route: route);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
