// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_menu_item_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SubMenuItemModel> _$subMenuItemModelSerializer =
    new _$SubMenuItemModelSerializer();

class _$SubMenuItemModelSerializer
    implements StructuredSerializer<SubMenuItemModel> {
  @override
  final Iterable<Type> types = const [SubMenuItemModel, _$SubMenuItemModel];
  @override
  final String wireName = 'SubMenuItemModel';

  @override
  Iterable<Object> serialize(Serializers serializers, SubMenuItemModel object,
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
  SubMenuItemModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SubMenuItemModelBuilder();

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

class _$SubMenuItemModel extends SubMenuItemModel {
  @override
  final String title;
  @override
  final String route;

  factory _$SubMenuItemModel(
          [void Function(SubMenuItemModelBuilder) updates]) =>
      (new SubMenuItemModelBuilder()..update(updates)).build();

  _$SubMenuItemModel._({this.title, this.route}) : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('SubMenuItemModel', 'title');
    }
    if (route == null) {
      throw new BuiltValueNullFieldError('SubMenuItemModel', 'route');
    }
  }

  @override
  SubMenuItemModel rebuild(void Function(SubMenuItemModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubMenuItemModelBuilder toBuilder() =>
      new SubMenuItemModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubMenuItemModel &&
        title == other.title &&
        route == other.route;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, title.hashCode), route.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SubMenuItemModel')
          ..add('title', title)
          ..add('route', route))
        .toString();
  }
}

class SubMenuItemModelBuilder
    implements Builder<SubMenuItemModel, SubMenuItemModelBuilder> {
  _$SubMenuItemModel _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _route;
  String get route => _$this._route;
  set route(String route) => _$this._route = route;

  SubMenuItemModelBuilder() {
    SubMenuItemModel._initializeBuilder(this);
  }

  SubMenuItemModelBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _route = _$v.route;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubMenuItemModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SubMenuItemModel;
  }

  @override
  void update(void Function(SubMenuItemModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SubMenuItemModel build() {
    final _$result =
        _$v ?? new _$SubMenuItemModel._(title: title, route: route);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
