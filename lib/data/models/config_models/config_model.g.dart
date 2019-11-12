// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ConfigModel> _$configModelSerializer = new _$ConfigModelSerializer();

class _$ConfigModelSerializer implements StructuredSerializer<ConfigModel> {
  @override
  final Iterable<Type> types = const [ConfigModel, _$ConfigModel];
  @override
  final String wireName = 'ConfigModel';

  @override
  Iterable<Object> serialize(Serializers serializers, ConfigModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'appDatasources',
      serializers.serialize(object.appDatasources,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(BaseDatasource)])),
    ];

    return result;
  }

  @override
  ConfigModel deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConfigModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'appDatasources':
          result.appDatasources.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(BaseDatasource)
              ])) as BuiltMap<dynamic, dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$ConfigModel extends ConfigModel {
  @override
  final BuiltMap<String, BaseDatasource> appDatasources;

  factory _$ConfigModel([void Function(ConfigModelBuilder) updates]) =>
      (new ConfigModelBuilder()..update(updates)).build();

  _$ConfigModel._({this.appDatasources}) : super._() {
    if (appDatasources == null) {
      throw new BuiltValueNullFieldError('ConfigModel', 'appDatasources');
    }
  }

  @override
  ConfigModel rebuild(void Function(ConfigModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfigModelBuilder toBuilder() => new ConfigModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfigModel && appDatasources == other.appDatasources;
  }

  @override
  int get hashCode {
    return $jf($jc(0, appDatasources.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ConfigModel')
          ..add('appDatasources', appDatasources))
        .toString();
  }
}

class ConfigModelBuilder implements Builder<ConfigModel, ConfigModelBuilder> {
  _$ConfigModel _$v;

  MapBuilder<String, BaseDatasource> _appDatasources;
  MapBuilder<String, BaseDatasource> get appDatasources =>
      _$this._appDatasources ??= new MapBuilder<String, BaseDatasource>();
  set appDatasources(MapBuilder<String, BaseDatasource> appDatasources) =>
      _$this._appDatasources = appDatasources;

  ConfigModelBuilder();

  ConfigModelBuilder get _$this {
    if (_$v != null) {
      _appDatasources = _$v.appDatasources?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConfigModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ConfigModel;
  }

  @override
  void update(void Function(ConfigModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ConfigModel build() {
    _$ConfigModel _$result;
    try {
      _$result =
          _$v ?? new _$ConfigModel._(appDatasources: appDatasources.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'appDatasources';
        appDatasources.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ConfigModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
