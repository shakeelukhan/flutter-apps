// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppModel _$AppModelFromJson(Map<String, dynamic> json) {
  return AppModel(
    title: json['title'] as String ?? 'NULL_TITLE',
    debugPaintSizeEnabled: json['debugPaintSizeEnabled'] as bool ?? false,
    debugPaintPointersEnabled:
        json['debugPaintPointersEnabled'] as bool ?? false,
    debugShowCheckedModeBanner:
        json['debugShowCheckedModeBanner'] as bool ?? false,
    showPerformanceOverlay: json['showPerformanceOverlay'] as bool ?? false,
    showSemanticsDebugger: json['showSemanticsDebugger'] as bool ?? false,
    remoteConfigDebugMode: json['remoteConfigDebugMode'] as bool ?? false,
    menuList: (json['menuList'] as List)
        ?.map((e) =>
            e == null ? null : MenuModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AppModelToJson(AppModel instance) => <String, dynamic>{
      'title': instance.title,
      'debugPaintSizeEnabled': instance.debugPaintSizeEnabled,
      'debugPaintPointersEnabled': instance.debugPaintPointersEnabled,
      'debugShowCheckedModeBanner': instance.debugShowCheckedModeBanner,
      'showPerformanceOverlay': instance.showPerformanceOverlay,
      'showSemanticsDebugger': instance.showSemanticsDebugger,
      'remoteConfigDebugMode': instance.remoteConfigDebugMode,
      'menuList': instance.menuList,
    };
