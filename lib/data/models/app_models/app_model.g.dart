// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppModel> _$appModelSerializer = new _$AppModelSerializer();

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
    ];
    if (object.menu != null) {
      result
        ..add('menu')
        ..add(serializers.serialize(object.menu,
            specifiedType: const FullType(
                BuiltList, const [const FullType(MenuItemModel)])));
    }
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
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MenuItemModel)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
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
  final BuiltList<MenuItemModel> menu;

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

  ListBuilder<MenuItemModel> _menu;
  ListBuilder<MenuItemModel> get menu =>
      _$this._menu ??= new ListBuilder<MenuItemModel>();
  set menu(ListBuilder<MenuItemModel> menu) => _$this._menu = menu;

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
              menu: _menu?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'menu';
        _menu?.build();
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
