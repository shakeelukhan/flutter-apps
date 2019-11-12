// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config_datasource.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RemoteConfigDatasource> _$remoteConfigDatasourceSerializer =
    new _$RemoteConfigDatasourceSerializer();

class _$RemoteConfigDatasourceSerializer
    implements StructuredSerializer<RemoteConfigDatasource> {
  @override
  final Iterable<Type> types = const [
    RemoteConfigDatasource,
    _$RemoteConfigDatasource
  ];
  @override
  final String wireName = 'RemoteConfigDatasource';

  @override
  Iterable<Object> serialize(
      Serializers serializers, RemoteConfigDatasource object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'key',
      serializers.serialize(object.key, specifiedType: const FullType(String)),
      'cache',
      serializers.serialize(object.cache, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  RemoteConfigDatasource deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RemoteConfigDatasourceBuilder();

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
        case 'cache':
          result.cache = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$RemoteConfigDatasource extends RemoteConfigDatasource {
  @override
  final String key;
  @override
  final bool cache;

  factory _$RemoteConfigDatasource(
          [void Function(RemoteConfigDatasourceBuilder) updates]) =>
      (new RemoteConfigDatasourceBuilder()..update(updates)).build();

  _$RemoteConfigDatasource._({this.key, this.cache}) : super._() {
    if (key == null) {
      throw new BuiltValueNullFieldError('RemoteConfigDatasource', 'key');
    }
    if (cache == null) {
      throw new BuiltValueNullFieldError('RemoteConfigDatasource', 'cache');
    }
  }

  @override
  RemoteConfigDatasource rebuild(
          void Function(RemoteConfigDatasourceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RemoteConfigDatasourceBuilder toBuilder() =>
      new RemoteConfigDatasourceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemoteConfigDatasource &&
        key == other.key &&
        cache == other.cache;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, key.hashCode), cache.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RemoteConfigDatasource')
          ..add('key', key)
          ..add('cache', cache))
        .toString();
  }
}

class RemoteConfigDatasourceBuilder
    implements Builder<RemoteConfigDatasource, RemoteConfigDatasourceBuilder> {
  _$RemoteConfigDatasource _$v;

  String _key;
  String get key => _$this._key;
  set key(String key) => _$this._key = key;

  bool _cache;
  bool get cache => _$this._cache;
  set cache(bool cache) => _$this._cache = cache;

  RemoteConfigDatasourceBuilder() {
    RemoteConfigDatasource._initializeBuilder(this);
  }

  RemoteConfigDatasourceBuilder get _$this {
    if (_$v != null) {
      _key = _$v.key;
      _cache = _$v.cache;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RemoteConfigDatasource other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RemoteConfigDatasource;
  }

  @override
  void update(void Function(RemoteConfigDatasourceBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RemoteConfigDatasource build() {
    final _$result =
        _$v ?? new _$RemoteConfigDatasource._(key: key, cache: cache);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
