// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (Serializers().toBuilder()
      ..add(AppModel.serializer)
      ..add(AssetDatasourceModel.serializer)
      ..add(ConfigModel.serializer)
      ..add(MenuItemModel.serializer)
      ..add(MenuModel.serializer)
      ..add(SubmenuItemModel.serializer)
      ..add(SubmenuModel.serializer)
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType(String),
            const FullType(BaseDatasourceModel)
          ]),
          () => MapBuilder<String, BaseDatasourceModel>())
      ..addBuilderFactory(
          const FullType(BuiltMap,
              const [const FullType(int), const FullType(MenuItemModel)]),
          () => MapBuilder<int, MenuItemModel>())
      ..addBuilderFactory(
          const FullType(BuiltMap,
              const [const FullType(int), const FullType(SubmenuItemModel)]),
          () => MapBuilder<int, SubmenuItemModel>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
