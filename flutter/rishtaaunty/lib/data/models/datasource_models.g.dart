// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datasource_models.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AssetDatasourceModel> _$assetDatasourceModelSerializer =
    new _$AssetDatasourceModelSerializer();
Serializer<RemoteConfigDatasourceModel>
    _$remoteConfigDatasourceModelSerializer =
    new _$RemoteConfigDatasourceModelSerializer();

class _$AssetDatasourceModelSerializer
    implements StructuredSerializer<AssetDatasourceModel> {
  @override
  final Iterable<Type> types = const [
    AssetDatasourceModel,
    _$AssetDatasourceModel
  ];
  @override
  final String wireName = 'AssetDatasourceModel';

  @override
  Iterable<Object> serialize(
      Serializers serializers, AssetDatasourceModel object,
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
  AssetDatasourceModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AssetDatasourceModelBuilder();

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

class _$RemoteConfigDatasourceModelSerializer
    implements StructuredSerializer<RemoteConfigDatasourceModel> {
  @override
  final Iterable<Type> types = const [
    RemoteConfigDatasourceModel,
    _$RemoteConfigDatasourceModel
  ];
  @override
  final String wireName = 'RemoteConfigDatasourceModel';

  @override
  Iterable<Object> serialize(
      Serializers serializers, RemoteConfigDatasourceModel object,
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
  RemoteConfigDatasourceModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RemoteConfigDatasourceModelBuilder();

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

class _$AssetDatasourceModel extends AssetDatasourceModel {
  @override
  final String key;
  @override
  final bool cache;

  factory _$AssetDatasourceModel(
          [void Function(AssetDatasourceModelBuilder) updates]) =>
      (new AssetDatasourceModelBuilder()..update(updates)).build();

  _$AssetDatasourceModel._({this.key, this.cache}) : super._() {
    if (key == null) {
      throw new BuiltValueNullFieldError('AssetDatasourceModel', 'key');
    }
    if (cache == null) {
      throw new BuiltValueNullFieldError('AssetDatasourceModel', 'cache');
    }
  }

  @override
  AssetDatasourceModel rebuild(
          void Function(AssetDatasourceModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssetDatasourceModelBuilder toBuilder() =>
      new AssetDatasourceModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssetDatasourceModel &&
        key == other.key &&
        cache == other.cache;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, key.hashCode), cache.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AssetDatasourceModel')
          ..add('key', key)
          ..add('cache', cache))
        .toString();
  }
}

class AssetDatasourceModelBuilder
    implements Builder<AssetDatasourceModel, AssetDatasourceModelBuilder> {
  _$AssetDatasourceModel _$v;

  String _key;
  String get key => _$this._key;
  set key(String key) => _$this._key = key;

  bool _cache;
  bool get cache => _$this._cache;
  set cache(bool cache) => _$this._cache = cache;

  AssetDatasourceModelBuilder() {
    AssetDatasourceModel._initializeBuilder(this);
  }

  AssetDatasourceModelBuilder get _$this {
    if (_$v != null) {
      _key = _$v.key;
      _cache = _$v.cache;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssetDatasourceModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AssetDatasourceModel;
  }

  @override
  void update(void Function(AssetDatasourceModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AssetDatasourceModel build() {
    final _$result =
        _$v ?? new _$AssetDatasourceModel._(key: key, cache: cache);
    replace(_$result);
    return _$result;
  }
}

class _$RemoteConfigDatasourceModel extends RemoteConfigDatasourceModel {
  @override
  final String key;
  @override
  final bool cache;

  factory _$RemoteConfigDatasourceModel(
          [void Function(RemoteConfigDatasourceModelBuilder) updates]) =>
      (new RemoteConfigDatasourceModelBuilder()..update(updates)).build();

  _$RemoteConfigDatasourceModel._({this.key, this.cache}) : super._() {
    if (key == null) {
      throw new BuiltValueNullFieldError('RemoteConfigDatasourceModel', 'key');
    }
    if (cache == null) {
      throw new BuiltValueNullFieldError(
          'RemoteConfigDatasourceModel', 'cache');
    }
  }

  @override
  RemoteConfigDatasourceModel rebuild(
          void Function(RemoteConfigDatasourceModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RemoteConfigDatasourceModelBuilder toBuilder() =>
      new RemoteConfigDatasourceModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemoteConfigDatasourceModel &&
        key == other.key &&
        cache == other.cache;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, key.hashCode), cache.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RemoteConfigDatasourceModel')
          ..add('key', key)
          ..add('cache', cache))
        .toString();
  }
}

class RemoteConfigDatasourceModelBuilder
    implements
        Builder<RemoteConfigDatasourceModel,
            RemoteConfigDatasourceModelBuilder> {
  _$RemoteConfigDatasourceModel _$v;

  String _key;
  String get key => _$this._key;
  set key(String key) => _$this._key = key;

  bool _cache;
  bool get cache => _$this._cache;
  set cache(bool cache) => _$this._cache = cache;

  RemoteConfigDatasourceModelBuilder() {
    RemoteConfigDatasourceModel._initializeBuilder(this);
  }

  RemoteConfigDatasourceModelBuilder get _$this {
    if (_$v != null) {
      _key = _$v.key;
      _cache = _$v.cache;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RemoteConfigDatasourceModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RemoteConfigDatasourceModel;
  }

  @override
  void update(void Function(RemoteConfigDatasourceModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RemoteConfigDatasourceModel build() {
    final _$result =
        _$v ?? new _$RemoteConfigDatasourceModel._(key: key, cache: cache);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
