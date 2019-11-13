// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MenuItemModel> _$menuItemModelSerializer =
    new _$MenuItemModelSerializer();

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
      }
    }

    return result.build();
  }
}

class _$MenuItemModel extends MenuItemModel {
  @override
  final String title;
  @override
  final int codePoint;
  @override
  final String fontFamily;

  factory _$MenuItemModel([void Function(MenuItemModelBuilder) updates]) =>
      (new MenuItemModelBuilder()..update(updates)).build();

  _$MenuItemModel._({this.title, this.codePoint, this.fontFamily}) : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('MenuItemModel', 'title');
    }
    if (codePoint == null) {
      throw new BuiltValueNullFieldError('MenuItemModel', 'codePoint');
    }
    if (fontFamily == null) {
      throw new BuiltValueNullFieldError('MenuItemModel', 'fontFamily');
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
        fontFamily == other.fontFamily;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, title.hashCode), codePoint.hashCode), fontFamily.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MenuItemModel')
          ..add('title', title)
          ..add('codePoint', codePoint)
          ..add('fontFamily', fontFamily))
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

  MenuItemModelBuilder() {
    MenuItemModel._initializeBuilder(this);
  }

  MenuItemModelBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _codePoint = _$v.codePoint;
      _fontFamily = _$v.fontFamily;
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
    final _$result = _$v ??
        new _$MenuItemModel._(
            title: title, codePoint: codePoint, fontFamily: fontFamily);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
