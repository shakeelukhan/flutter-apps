// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppModel _$AppModelFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const [
    'title'
  ], disallowNullValues: const [
    'title',
    'debugPaintSizeEnabled',
    'debugPaintPointersEnabled',
    'debugShowCheckedModeBanner',
    'showPerformanceOverlay',
    'showSemanticsDebugger',
    'remoteConfigDebugMode'
  ]);
  return AppModel(
    title: json['title'] as String,
    debugPaintSizeEnabled: json['debugPaintSizeEnabled'] as bool ?? false,
    debugPaintPointersEnabled:
        json['debugPaintPointersEnabled'] as bool ?? false,
    debugShowCheckedModeBanner:
        json['debugShowCheckedModeBanner'] as bool ?? false,
    showPerformanceOverlay: json['showPerformanceOverlay'] as bool ?? false,
    showSemanticsDebugger: json['showSemanticsDebugger'] as bool ?? false,
    remoteConfigDebugMode: json['remoteConfigDebugMode'] as bool ?? false,
  );
}

Map<String, dynamic> _$AppModelToJson(AppModel instance) {
  final val = <String, dynamic>{
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('debugPaintSizeEnabled', instance.debugPaintSizeEnabled);
  writeNotNull('debugPaintPointersEnabled', instance.debugPaintPointersEnabled);
  writeNotNull(
      'debugShowCheckedModeBanner', instance.debugShowCheckedModeBanner);
  writeNotNull('showPerformanceOverlay', instance.showPerformanceOverlay);
  writeNotNull('showSemanticsDebugger', instance.showSemanticsDebugger);
  writeNotNull('remoteConfigDebugMode', instance.remoteConfigDebugMode);
  return val;
}
