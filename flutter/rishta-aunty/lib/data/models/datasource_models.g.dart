// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datasource_models.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AssetDatasourceModel> _$assetDatasourceModelSerializer =
    _$AssetDatasourceModelSerializer();

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
  Iterable<Object?> serialize(
      Serializers serializers, AssetDatasourceModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'key',
      serializers.serialize(object.key, specifiedType: const FullType(String)),
      'cache',
      serializers.serialize(object.cache, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  AssetDatasourceModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = AssetDatasourceModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'key':
          result.key = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'cache':
          result.cache = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
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
          [void Function(AssetDatasourceModelBuilder)? updates]) =>
      (AssetDatasourceModelBuilder()..update(updates))._build();

  _$AssetDatasourceModel._({required this.key, required this.cache})
      : super._();
  @override
  AssetDatasourceModel rebuild(
          void Function(AssetDatasourceModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssetDatasourceModelBuilder toBuilder() =>
      AssetDatasourceModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssetDatasourceModel &&
        key == other.key &&
        cache == other.cache;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, cache.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AssetDatasourceModel')
          ..add('key', key)
          ..add('cache', cache))
        .toString();
  }
}

class AssetDatasourceModelBuilder
    implements Builder<AssetDatasourceModel, AssetDatasourceModelBuilder> {
  _$AssetDatasourceModel? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  bool? _cache;
  bool? get cache => _$this._cache;
  set cache(bool? cache) => _$this._cache = cache;

  AssetDatasourceModelBuilder() {
    AssetDatasourceModel._initializeBuilder(this);
  }

  AssetDatasourceModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _cache = $v.cache;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssetDatasourceModel other) {
    _$v = other as _$AssetDatasourceModel;
  }

  @override
  void update(void Function(AssetDatasourceModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AssetDatasourceModel build() => _build();

  _$AssetDatasourceModel _build() {
    final _$result = _$v ??
        _$AssetDatasourceModel._(
          key: BuiltValueNullFieldError.checkNotNull(
              key, r'AssetDatasourceModel', 'key'),
          cache: BuiltValueNullFieldError.checkNotNull(
              cache, r'AssetDatasourceModel', 'cache'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
