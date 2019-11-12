// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config_datasource.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RemoteConfigDatasource> _$remoteConfigDatasourceSerializer =
    new _$RemoteConfigDatasourceSerializer();
Serializer<RemoteConfigDatasource2> _$remoteConfigDatasource2Serializer =
    new _$RemoteConfigDatasource2Serializer();

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
    if (object.remoteConfigFuture != null) {
      result
        ..add('remoteConfigFuture')
        ..add(serializers.serialize(object.remoteConfigFuture,
            specifiedType:
                const FullType(Future, const [const FullType(RemoteConfig)])));
    }
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
        case 'remoteConfigFuture':
          result.remoteConfigFuture = serializers.deserialize(value,
                  specifiedType: const FullType(
                      Future, const [const FullType(RemoteConfig)]))
              as Future<RemoteConfig>;
          break;
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

class _$RemoteConfigDatasource2Serializer
    implements StructuredSerializer<RemoteConfigDatasource2> {
  @override
  final Iterable<Type> types = const [
    RemoteConfigDatasource2,
    _$RemoteConfigDatasource2
  ];
  @override
  final String wireName = 'RemoteConfigDatasource2';

  @override
  Iterable<Object> serialize(
      Serializers serializers, RemoteConfigDatasource2 object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'key',
      serializers.serialize(object.key, specifiedType: const FullType(String)),
      'cache',
      serializers.serialize(object.cache, specifiedType: const FullType(bool)),
    ];
    if (object.key2 != null) {
      result
        ..add('key2')
        ..add(serializers.serialize(object.key2,
            specifiedType:
                const FullType(Future, const [const FullType(String)])));
    }
    return result;
  }

  @override
  RemoteConfigDatasource2 deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RemoteConfigDatasource2Builder();

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
        case 'key2':
          result.key2 = serializers.deserialize(value,
                  specifiedType:
                      const FullType(Future, const [const FullType(String)]))
              as Future<String>;
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
  final Future<RemoteConfig> remoteConfigFuture;
  @override
  final String key;
  @override
  final bool cache;

  factory _$RemoteConfigDatasource(
          [void Function(RemoteConfigDatasourceBuilder) updates]) =>
      (new RemoteConfigDatasourceBuilder()..update(updates)).build();

  _$RemoteConfigDatasource._({this.remoteConfigFuture, this.key, this.cache})
      : super._() {
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
        remoteConfigFuture == other.remoteConfigFuture &&
        key == other.key &&
        cache == other.cache;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, remoteConfigFuture.hashCode), key.hashCode),
        cache.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RemoteConfigDatasource')
          ..add('remoteConfigFuture', remoteConfigFuture)
          ..add('key', key)
          ..add('cache', cache))
        .toString();
  }
}

class RemoteConfigDatasourceBuilder
    implements Builder<RemoteConfigDatasource, RemoteConfigDatasourceBuilder> {
  _$RemoteConfigDatasource _$v;

  Future<RemoteConfig> _remoteConfigFuture;
  Future<RemoteConfig> get remoteConfigFuture => _$this._remoteConfigFuture;
  set remoteConfigFuture(Future<RemoteConfig> remoteConfigFuture) =>
      _$this._remoteConfigFuture = remoteConfigFuture;

  String _key;
  String get key => _$this._key;
  set key(String key) => _$this._key = key;

  bool _cache;
  bool get cache => _$this._cache;
  set cache(bool cache) => _$this._cache = cache;

  RemoteConfigDatasourceBuilder();

  RemoteConfigDatasourceBuilder get _$this {
    if (_$v != null) {
      _remoteConfigFuture = _$v.remoteConfigFuture;
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
    final _$result = _$v ??
        new _$RemoteConfigDatasource._(
            remoteConfigFuture: remoteConfigFuture, key: key, cache: cache);
    replace(_$result);
    return _$result;
  }
}

class _$RemoteConfigDatasource2 extends RemoteConfigDatasource2 {
  @override
  final String key;
  @override
  final Future<String> key2;
  @override
  final bool cache;

  factory _$RemoteConfigDatasource2(
          [void Function(RemoteConfigDatasource2Builder) updates]) =>
      (new RemoteConfigDatasource2Builder()..update(updates)).build();

  _$RemoteConfigDatasource2._({this.key, this.key2, this.cache}) : super._() {
    if (key == null) {
      throw new BuiltValueNullFieldError('RemoteConfigDatasource2', 'key');
    }
    if (cache == null) {
      throw new BuiltValueNullFieldError('RemoteConfigDatasource2', 'cache');
    }
  }

  @override
  RemoteConfigDatasource2 rebuild(
          void Function(RemoteConfigDatasource2Builder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RemoteConfigDatasource2Builder toBuilder() =>
      new RemoteConfigDatasource2Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemoteConfigDatasource2 &&
        key == other.key &&
        key2 == other.key2 &&
        cache == other.cache;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, key.hashCode), key2.hashCode), cache.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RemoteConfigDatasource2')
          ..add('key', key)
          ..add('key2', key2)
          ..add('cache', cache))
        .toString();
  }
}

class RemoteConfigDatasource2Builder
    implements
        Builder<RemoteConfigDatasource2, RemoteConfigDatasource2Builder> {
  _$RemoteConfigDatasource2 _$v;

  String _key;
  String get key => _$this._key;
  set key(String key) => _$this._key = key;

  Future<String> _key2;
  Future<String> get key2 => _$this._key2;
  set key2(Future<String> key2) => _$this._key2 = key2;

  bool _cache;
  bool get cache => _$this._cache;
  set cache(bool cache) => _$this._cache = cache;

  RemoteConfigDatasource2Builder();

  RemoteConfigDatasource2Builder get _$this {
    if (_$v != null) {
      _key = _$v.key;
      _key2 = _$v.key2;
      _cache = _$v.cache;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RemoteConfigDatasource2 other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RemoteConfigDatasource2;
  }

  @override
  void update(void Function(RemoteConfigDatasource2Builder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RemoteConfigDatasource2 build() {
    final _$result = _$v ??
        new _$RemoteConfigDatasource2._(key: key, key2: key2, cache: cache);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
