// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_sources_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppSourcesModel> _$appSourcesModelSerializer =
    new _$AppSourcesModelSerializer();

class _$AppSourcesModelSerializer
    implements StructuredSerializer<AppSourcesModel> {
  @override
  final Iterable<Type> types = const [AppSourcesModel, _$AppSourcesModel];
  @override
  final String wireName = 'AppSourcesModel';

  @override
  Iterable<Object> serialize(Serializers serializers, AppSourcesModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'sources',
      serializers.serialize(object.sources,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(AppSourceModel)])),
    ];

    return result;
  }

  @override
  AppSourcesModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppSourcesModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'sources':
          result.sources.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(AppSourceModel)
              ])) as BuiltMap<dynamic, dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$AppSourcesModel extends AppSourcesModel {
  @override
  final BuiltMap<String, AppSourceModel> sources;

  factory _$AppSourcesModel([void Function(AppSourcesModelBuilder) updates]) =>
      (new AppSourcesModelBuilder()..update(updates)).build();

  _$AppSourcesModel._({this.sources}) : super._() {
    if (sources == null) {
      throw new BuiltValueNullFieldError('AppSourcesModel', 'sources');
    }
  }

  @override
  AppSourcesModel rebuild(void Function(AppSourcesModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppSourcesModelBuilder toBuilder() =>
      new AppSourcesModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppSourcesModel && sources == other.sources;
  }

  @override
  int get hashCode {
    return $jf($jc(0, sources.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppSourcesModel')
          ..add('sources', sources))
        .toString();
  }
}

class AppSourcesModelBuilder
    implements Builder<AppSourcesModel, AppSourcesModelBuilder> {
  _$AppSourcesModel _$v;

  MapBuilder<String, AppSourceModel> _sources;
  MapBuilder<String, AppSourceModel> get sources =>
      _$this._sources ??= new MapBuilder<String, AppSourceModel>();
  set sources(MapBuilder<String, AppSourceModel> sources) =>
      _$this._sources = sources;

  AppSourcesModelBuilder();

  AppSourcesModelBuilder get _$this {
    if (_$v != null) {
      _sources = _$v.sources?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppSourcesModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppSourcesModel;
  }

  @override
  void update(void Function(AppSourcesModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppSourcesModel build() {
    _$AppSourcesModel _$result;
    try {
      _$result = _$v ?? new _$AppSourcesModel._(sources: sources.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'sources';
        sources.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppSourcesModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
