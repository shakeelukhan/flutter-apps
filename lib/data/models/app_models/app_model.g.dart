// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppModel> _$appModelSerializer = new _$AppModelSerializer();

class _$AppModelSerializer implements StructuredSerializer<AppModel> {
  @override
  final Iterable<Type> types = const [AppModel, _$AppModel];
  @override
  final String wireName = 'AppModel';

  @override
  Iterable<Object> serialize(Serializers serializers, AppModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'appPage',
      serializers.serialize(object.appPage,
          specifiedType: const FullType(AppPageModel)),
    ];

    return result;
  }

  @override
  AppModel deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'appPage':
          result.appPage.replace(serializers.deserialize(value,
              specifiedType: const FullType(AppPageModel)) as AppPageModel);
          break;
      }
    }

    return result.build();
  }
}

class _$AppModel extends AppModel {
  @override
  final AppPageModel appPage;

  factory _$AppModel([void Function(AppModelBuilder) updates]) =>
      (new AppModelBuilder()..update(updates)).build();

  _$AppModel._({this.appPage}) : super._() {
    if (appPage == null) {
      throw new BuiltValueNullFieldError('AppModel', 'appPage');
    }
  }

  @override
  AppModel rebuild(void Function(AppModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppModelBuilder toBuilder() => new AppModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppModel && appPage == other.appPage;
  }

  @override
  int get hashCode {
    return $jf($jc(0, appPage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppModel')..add('appPage', appPage))
        .toString();
  }
}

class AppModelBuilder implements Builder<AppModel, AppModelBuilder> {
  _$AppModel _$v;

  AppPageModelBuilder _appPage;
  AppPageModelBuilder get appPage =>
      _$this._appPage ??= new AppPageModelBuilder();
  set appPage(AppPageModelBuilder appPage) => _$this._appPage = appPage;

  AppModelBuilder();

  AppModelBuilder get _$this {
    if (_$v != null) {
      _appPage = _$v.appPage?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppModel;
  }

  @override
  void update(void Function(AppModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppModel build() {
    _$AppModel _$result;
    try {
      _$result = _$v ?? new _$AppModel._(appPage: appPage.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'appPage';
        appPage.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
