// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_source_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ConfigSourceModel> _$configSourceModelSerializer =
    new _$ConfigSourceModelSerializer();

class _$ConfigSourceModelSerializer
    implements StructuredSerializer<ConfigSourceModel> {
  @override
  final Iterable<Type> types = const [ConfigSourceModel, _$ConfigSourceModel];
  @override
  final String wireName = 'ConfigSourceModel';

  @override
  Iterable<Object> serialize(Serializers serializers, ConfigSourceModel object,
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
  ConfigSourceModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConfigSourceModelBuilder();

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

class _$ConfigSourceModel extends ConfigSourceModel {
  @override
  final String key;
  @override
  final bool local;
  @override
  final bool cache;

  factory _$ConfigSourceModel(
          [void Function(ConfigSourceModelBuilder) updates]) =>
      (new ConfigSourceModelBuilder()..update(updates)).build();

  _$ConfigSourceModel._({this.key, this.local, this.cache}) : super._() {
    if (key == null) {
      throw new BuiltValueNullFieldError('ConfigSourceModel', 'key');
    }
    if (local == null) {
      throw new BuiltValueNullFieldError('ConfigSourceModel', 'local');
    }
    if (cache == null) {
      throw new BuiltValueNullFieldError('ConfigSourceModel', 'cache');
    }
  }

  @override
  ConfigSourceModel rebuild(void Function(ConfigSourceModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfigSourceModelBuilder toBuilder() =>
      new ConfigSourceModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfigSourceModel &&
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
    return (newBuiltValueToStringHelper('ConfigSourceModel')
          ..add('key', key)
          ..add('local', local)
          ..add('cache', cache))
        .toString();
  }
}

class ConfigSourceModelBuilder
    implements Builder<ConfigSourceModel, ConfigSourceModelBuilder> {
  _$ConfigSourceModel _$v;

  String _key;
  String get key => _$this._key;
  set key(String key) => _$this._key = key;

  bool _local;
  bool get local => _$this._local;
  set local(bool local) => _$this._local = local;

  bool _cache;
  bool get cache => _$this._cache;
  set cache(bool cache) => _$this._cache = cache;

  ConfigSourceModelBuilder() {
    ConfigSourceModel._initializeBuilder(this);
  }

  ConfigSourceModelBuilder get _$this {
    if (_$v != null) {
      _key = _$v.key;
      _local = _$v.local;
      _cache = _$v.cache;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConfigSourceModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ConfigSourceModel;
  }

  @override
  void update(void Function(ConfigSourceModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ConfigSourceModel build() {
    final _$result =
        _$v ?? new _$ConfigSourceModel._(key: key, local: local, cache: cache);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
