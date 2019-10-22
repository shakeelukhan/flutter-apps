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
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];
    if (object.debugPaintSizeEnabled != null) {
      result
        ..add('debugPaintSizeEnabled')
        ..add(serializers.serialize(object.debugPaintSizeEnabled,
            specifiedType: const FullType(bool)));
    }
    if (object.debugPaintPointersEnabled != null) {
      result
        ..add('debugPaintPointersEnabled')
        ..add(serializers.serialize(object.debugPaintPointersEnabled,
            specifiedType: const FullType(bool)));
    }
    if (object.debugShowCheckedModeBanner != null) {
      result
        ..add('debugShowCheckedModeBanner')
        ..add(serializers.serialize(object.debugShowCheckedModeBanner,
            specifiedType: const FullType(bool)));
    }
    if (object.showPerformanceOverlay != null) {
      result
        ..add('showPerformanceOverlay')
        ..add(serializers.serialize(object.showPerformanceOverlay,
            specifiedType: const FullType(bool)));
    }
    if (object.showSemanticsDebugger != null) {
      result
        ..add('showSemanticsDebugger')
        ..add(serializers.serialize(object.showSemanticsDebugger,
            specifiedType: const FullType(bool)));
    }
    if (object.remoteConfigDebugMode != null) {
      result
        ..add('remoteConfigDebugMode')
        ..add(serializers.serialize(object.remoteConfigDebugMode,
            specifiedType: const FullType(bool)));
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
        case 'remoteConfigDebugMode':
          result.remoteConfigDebugMode = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$AppModel extends AppModel {
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
  @override
  final bool remoteConfigDebugMode;

  factory _$AppModel([void Function(AppModelBuilder) updates]) =>
      (new AppModelBuilder()..update(updates)).build();

  _$AppModel._(
      {this.title,
      this.debugPaintSizeEnabled,
      this.debugPaintPointersEnabled,
      this.debugShowCheckedModeBanner,
      this.showPerformanceOverlay,
      this.showSemanticsDebugger,
      this.remoteConfigDebugMode})
      : super._() {
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
        title == other.title &&
        debugPaintSizeEnabled == other.debugPaintSizeEnabled &&
        debugPaintPointersEnabled == other.debugPaintPointersEnabled &&
        debugShowCheckedModeBanner == other.debugShowCheckedModeBanner &&
        showPerformanceOverlay == other.showPerformanceOverlay &&
        showSemanticsDebugger == other.showSemanticsDebugger &&
        remoteConfigDebugMode == other.remoteConfigDebugMode;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc(0, title.hashCode),
                            debugPaintSizeEnabled.hashCode),
                        debugPaintPointersEnabled.hashCode),
                    debugShowCheckedModeBanner.hashCode),
                showPerformanceOverlay.hashCode),
            showSemanticsDebugger.hashCode),
        remoteConfigDebugMode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppModel')
          ..add('title', title)
          ..add('debugPaintSizeEnabled', debugPaintSizeEnabled)
          ..add('debugPaintPointersEnabled', debugPaintPointersEnabled)
          ..add('debugShowCheckedModeBanner', debugShowCheckedModeBanner)
          ..add('showPerformanceOverlay', showPerformanceOverlay)
          ..add('showSemanticsDebugger', showSemanticsDebugger)
          ..add('remoteConfigDebugMode', remoteConfigDebugMode))
        .toString();
  }
}

class AppModelBuilder implements Builder<AppModel, AppModelBuilder> {
  _$AppModel _$v;

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

  bool _remoteConfigDebugMode;
  bool get remoteConfigDebugMode => _$this._remoteConfigDebugMode;
  set remoteConfigDebugMode(bool remoteConfigDebugMode) =>
      _$this._remoteConfigDebugMode = remoteConfigDebugMode;

  AppModelBuilder();

  AppModelBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _debugPaintSizeEnabled = _$v.debugPaintSizeEnabled;
      _debugPaintPointersEnabled = _$v.debugPaintPointersEnabled;
      _debugShowCheckedModeBanner = _$v.debugShowCheckedModeBanner;
      _showPerformanceOverlay = _$v.showPerformanceOverlay;
      _showSemanticsDebugger = _$v.showSemanticsDebugger;
      _remoteConfigDebugMode = _$v.remoteConfigDebugMode;
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
    final _$result = _$v ??
        new _$AppModel._(
            title: title,
            debugPaintSizeEnabled: debugPaintSizeEnabled,
            debugPaintPointersEnabled: debugPaintPointersEnabled,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner,
            showPerformanceOverlay: showPerformanceOverlay,
            showSemanticsDebugger: showSemanticsDebugger,
            remoteConfigDebugMode: remoteConfigDebugMode);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
