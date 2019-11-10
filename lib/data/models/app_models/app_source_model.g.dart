// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_source_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppSourceModel> _$appSourceModelSerializer =
    new _$AppSourceModelSerializer();

class _$AppSourceModelSerializer
    implements StructuredSerializer<AppSourceModel> {
  @override
  final Iterable<Type> types = const [AppSourceModel, _$AppSourceModel];
  @override
  final String wireName = 'AppSourceModel';

  @override
  Iterable<Object> serialize(Serializers serializers, AppSourceModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'key',
      serializers.serialize(object.key, specifiedType: const FullType(String)),
      'local',
      serializers.serialize(object.local, specifiedType: const FullType(bool)),
      'cache',
      serializers.serialize(object.cache, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  AppSourceModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppSourceModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'key':
          result.key = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'local':
          result.local = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'cache':
          result.cache = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$AppSourceModel extends AppSourceModel {
  @override
  final String key;
  @override
  final bool local;
  @override
  final bool cache;

  factory _$AppSourceModel([void Function(AppSourceModelBuilder) updates]) =>
      (new AppSourceModelBuilder()..update(updates)).build();

  _$AppSourceModel._({this.key, this.local, this.cache}) : super._() {
    if (key == null) {
      throw new BuiltValueNullFieldError('AppSourceModel', 'key');
    }
    if (local == null) {
      throw new BuiltValueNullFieldError('AppSourceModel', 'local');
    }
    if (cache == null) {
      throw new BuiltValueNullFieldError('AppSourceModel', 'cache');
    }
  }

  @override
  AppSourceModel rebuild(void Function(AppSourceModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppSourceModelBuilder toBuilder() =>
      new AppSourceModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppSourceModel &&
        key == other.key &&
        local == other.local &&
        cache == other.cache;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, key.hashCode), local.hashCode), cache.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppSourceModel')
          ..add('key', key)
          ..add('local', local)
          ..add('cache', cache))
        .toString();
  }
}

class AppSourceModelBuilder
    implements Builder<AppSourceModel, AppSourceModelBuilder> {
  _$AppSourceModel _$v;

  String _key;
  String get key => _$this._key;
  set key(String key) => _$this._key = key;

  bool _local;
  bool get local => _$this._local;
  set local(bool local) => _$this._local = local;

  bool _cache;
  bool get cache => _$this._cache;
  set cache(bool cache) => _$this._cache = cache;

  AppSourceModelBuilder();

  AppSourceModelBuilder get _$this {
    if (_$v != null) {
      _key = _$v.key;
      _local = _$v.local;
      _cache = _$v.cache;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppSourceModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppSourceModel;
  }

  @override
  void update(void Function(AppSourceModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppSourceModel build() {
    final _$result =
        _$v ?? new _$AppSourceModel._(key: key, local: local, cache: cache);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
