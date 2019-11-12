// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_datasource.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AssetDatasource> _$assetDatasourceSerializer =
    new _$AssetDatasourceSerializer();

class _$AssetDatasourceSerializer
    implements StructuredSerializer<AssetDatasource> {
  @override
  final Iterable<Type> types = const [AssetDatasource, _$AssetDatasource];
  @override
  final String wireName = 'AssetDatasource';

  @override
  Iterable<Object> serialize(Serializers serializers, AssetDatasource object,
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
  AssetDatasource deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AssetDatasourceBuilder();

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

class _$AssetDatasource extends AssetDatasource {
  @override
  final String key;
  @override
  final bool cache;

  factory _$AssetDatasource([void Function(AssetDatasourceBuilder) updates]) =>
      (new AssetDatasourceBuilder()..update(updates)).build();

  _$AssetDatasource._({this.key, this.cache}) : super._() {
    if (key == null) {
      throw new BuiltValueNullFieldError('AssetDatasource', 'key');
    }
    if (cache == null) {
      throw new BuiltValueNullFieldError('AssetDatasource', 'cache');
    }
  }

  @override
  AssetDatasource rebuild(void Function(AssetDatasourceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssetDatasourceBuilder toBuilder() =>
      new AssetDatasourceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssetDatasource && key == other.key && cache == other.cache;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, key.hashCode), cache.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AssetDatasource')
          ..add('key', key)
          ..add('cache', cache))
        .toString();
  }
}

class AssetDatasourceBuilder
    implements Builder<AssetDatasource, AssetDatasourceBuilder> {
  _$AssetDatasource _$v;

  String _key;
  String get key => _$this._key;
  set key(String key) => _$this._key = key;

  bool _cache;
  bool get cache => _$this._cache;
  set cache(bool cache) => _$this._cache = cache;

  AssetDatasourceBuilder();

  AssetDatasourceBuilder get _$this {
    if (_$v != null) {
      _key = _$v.key;
      _cache = _$v.cache;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssetDatasource other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AssetDatasource;
  }

  @override
  void update(void Function(AssetDatasourceBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AssetDatasource build() {
    final _$result = _$v ?? new _$AssetDatasource._(key: key, cache: cache);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
