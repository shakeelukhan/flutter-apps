// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_page_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppPageModel> _$appPageModelSerializer =
    new _$AppPageModelSerializer();

class _$AppPageModelSerializer implements StructuredSerializer<AppPageModel> {
  @override
  final Iterable<Type> types = const [AppPageModel, _$AppPageModel];
  @override
  final String wireName = 'AppPageModel';

  @override
  Iterable<Object> serialize(Serializers serializers, AppPageModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'debugPaintSizeEnabled',
      serializers.serialize(object.debugPaintSizeEnabled,
          specifiedType: const FullType(bool)),
      'debugPaintPointersEnabled',
      serializers.serialize(object.debugPaintPointersEnabled,
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
    ];

    return result;
  }

  @override
  AppPageModel deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppPageModelBuilder();

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
        case 'debugPaintSizeEnabled':
          result.debugPaintSizeEnabled = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'debugPaintPointersEnabled':
          result.debugPaintPointersEnabled = serializers.deserialize(value,
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
      }
    }

    return result.build();
  }
}

class _$AppPageModel extends AppPageModel {
  @override
  final String title;
  @override
  final bool debugPaintSizeEnabled;
  @override
  final bool debugPaintPointersEnabled;
  @override
  final bool debugShowCheckedModeBanner;
  @override
  final bool showPerformanceOverlay;
  @override
  final bool showSemanticsDebugger;

  factory _$AppPageModel([void Function(AppPageModelBuilder) updates]) =>
      (new AppPageModelBuilder()..update(updates)).build();

  _$AppPageModel._(
      {this.title,
      this.debugPaintSizeEnabled,
      this.debugPaintPointersEnabled,
      this.debugShowCheckedModeBanner,
      this.showPerformanceOverlay,
      this.showSemanticsDebugger})
      : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('AppPageModel', 'title');
    }
    if (debugPaintSizeEnabled == null) {
      throw new BuiltValueNullFieldError(
          'AppPageModel', 'debugPaintSizeEnabled');
    }
    if (debugPaintPointersEnabled == null) {
      throw new BuiltValueNullFieldError(
          'AppPageModel', 'debugPaintPointersEnabled');
    }
    if (debugShowCheckedModeBanner == null) {
      throw new BuiltValueNullFieldError(
          'AppPageModel', 'debugShowCheckedModeBanner');
    }
    if (showPerformanceOverlay == null) {
      throw new BuiltValueNullFieldError(
          'AppPageModel', 'showPerformanceOverlay');
    }
    if (showSemanticsDebugger == null) {
      throw new BuiltValueNullFieldError(
          'AppPageModel', 'showSemanticsDebugger');
    }
  }

  @override
  AppPageModel rebuild(void Function(AppPageModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppPageModelBuilder toBuilder() => new AppPageModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppPageModel &&
        title == other.title &&
        debugPaintSizeEnabled == other.debugPaintSizeEnabled &&
        debugPaintPointersEnabled == other.debugPaintPointersEnabled &&
        debugShowCheckedModeBanner == other.debugShowCheckedModeBanner &&
        showPerformanceOverlay == other.showPerformanceOverlay &&
        showSemanticsDebugger == other.showSemanticsDebugger;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, title.hashCode), debugPaintSizeEnabled.hashCode),
                    debugPaintPointersEnabled.hashCode),
                debugShowCheckedModeBanner.hashCode),
            showPerformanceOverlay.hashCode),
        showSemanticsDebugger.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppPageModel')
          ..add('title', title)
          ..add('debugPaintSizeEnabled', debugPaintSizeEnabled)
          ..add('debugPaintPointersEnabled', debugPaintPointersEnabled)
          ..add('debugShowCheckedModeBanner', debugShowCheckedModeBanner)
          ..add('showPerformanceOverlay', showPerformanceOverlay)
          ..add('showSemanticsDebugger', showSemanticsDebugger))
        .toString();
  }
}

class AppPageModelBuilder
    implements Builder<AppPageModel, AppPageModelBuilder> {
  _$AppPageModel _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  bool _debugPaintSizeEnabled;
  bool get debugPaintSizeEnabled => _$this._debugPaintSizeEnabled;
  set debugPaintSizeEnabled(bool debugPaintSizeEnabled) =>
      _$this._debugPaintSizeEnabled = debugPaintSizeEnabled;

  bool _debugPaintPointersEnabled;
  bool get debugPaintPointersEnabled => _$this._debugPaintPointersEnabled;
  set debugPaintPointersEnabled(bool debugPaintPointersEnabled) =>
      _$this._debugPaintPointersEnabled = debugPaintPointersEnabled;

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

  AppPageModelBuilder() {
    AppPageModel._initializeBuilder(this);
  }

  AppPageModelBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _debugPaintSizeEnabled = _$v.debugPaintSizeEnabled;
      _debugPaintPointersEnabled = _$v.debugPaintPointersEnabled;
      _debugShowCheckedModeBanner = _$v.debugShowCheckedModeBanner;
      _showPerformanceOverlay = _$v.showPerformanceOverlay;
      _showSemanticsDebugger = _$v.showSemanticsDebugger;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppPageModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppPageModel;
  }

  @override
  void update(void Function(AppPageModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppPageModel build() {
    final _$result = _$v ??
        new _$AppPageModel._(
            title: title,
            debugPaintSizeEnabled: debugPaintSizeEnabled,
            debugPaintPointersEnabled: debugPaintPointersEnabled,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner,
            showPerformanceOverlay: showPerformanceOverlay,
            showSemanticsDebugger: showSemanticsDebugger);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
