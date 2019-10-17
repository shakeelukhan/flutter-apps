// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuModel _$MenuModelFromJson(Map<String, dynamic> json) {
  return MenuModel(
    title: json['title'] as String ?? 'TAB',
    codePoint: json['codePoint'] as int ?? 59517,
    fontFamily: json['fontFamily'] as String ?? 'MaterialIcons',
  );
}

Map<String, dynamic> _$MenuModelToJson(MenuModel instance) => <String, dynamic>{
      'title': instance.title,
      'codePoint': instance.codePoint,
      'fontFamily': instance.fontFamily,
    };
