// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_widget_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MenuWidgetModel> _$menuWidgetModelSerializer =
    new _$MenuWidgetModelSerializer();

class _$MenuWidgetModelSerializer
    implements StructuredSerializer<MenuWidgetModel> {
  @override
  final Iterable<Type> types = const [MenuWidgetModel, _$MenuWidgetModel];
  @override
  final String wireName = 'MenuWidgetModel';

  @override
  Iterable<Object> serialize(Serializers serializers, MenuWidgetModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.title != null) {
      result
        ..add('title')
        ..add(serializers.serialize(object.title,
            specifiedType: const FullType(String)));
    }
    if (object.codePoint != null) {
      result
        ..add('codePoint')
        ..add(serializers.serialize(object.codePoint,
            specifiedType: const FullType(int)));
    }
    if (object.fontFamily != null) {
      result
        ..add('fontFamily')
        ..add(serializers.serialize(object.fontFamily,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  MenuWidgetModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MenuWidgetModelBuilder();

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
      }
    }

    return result.build();
  }
}

class _$MenuWidgetModel extends MenuWidgetModel {
  @override
  final String title;
  @override
  final int codePoint;
  @override
  final String fontFamily;

  factory _$MenuWidgetModel([void Function(MenuWidgetModelBuilder) updates]) =>
      (new MenuWidgetModelBuilder()..update(updates)).build();

  _$MenuWidgetModel._({this.title, this.codePoint, this.fontFamily})
      : super._();

  @override
  MenuWidgetModel rebuild(void Function(MenuWidgetModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MenuWidgetModelBuilder toBuilder() =>
      new MenuWidgetModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MenuWidgetModel &&
        title == other.title &&
        codePoint == other.codePoint &&
        fontFamily == other.fontFamily;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, title.hashCode), codePoint.hashCode), fontFamily.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MenuWidgetModel')
          ..add('title', title)
          ..add('codePoint', codePoint)
          ..add('fontFamily', fontFamily))
        .toString();
  }
}

class MenuWidgetModelBuilder
    implements Builder<MenuWidgetModel, MenuWidgetModelBuilder> {
  _$MenuWidgetModel _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  int _codePoint;
  int get codePoint => _$this._codePoint;
  set codePoint(int codePoint) => _$this._codePoint = codePoint;

  String _fontFamily;
  String get fontFamily => _$this._fontFamily;
  set fontFamily(String fontFamily) => _$this._fontFamily = fontFamily;

  MenuWidgetModelBuilder();

  MenuWidgetModelBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _codePoint = _$v.codePoint;
      _fontFamily = _$v.fontFamily;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MenuWidgetModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MenuWidgetModel;
  }

  @override
  void update(void Function(MenuWidgetModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MenuWidgetModel build() {
    final _$result = _$v ??
        new _$MenuWidgetModel._(
            title: title, codePoint: codePoint, fontFamily: fontFamily);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
