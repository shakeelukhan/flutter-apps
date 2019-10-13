import 'package:json_annotation/json_annotation.dart';

part 'app_model.g.dart';

@JsonSerializable(nullable: false)
class AppModel {
  @JsonKey(disallowNullValue: true, required: true, nullable: false)
  final String title;

  @JsonKey(
      defaultValue: false,
      disallowNullValue: true,
      required: false,
      nullable: true)
  final bool debugPaintSizeEnabled;

  @JsonKey(
      defaultValue: false,
      disallowNullValue: true,
      required: false,
      nullable: true)
  final bool debugPaintPointersEnabled;

  @JsonKey(
      defaultValue: false,
      disallowNullValue: true,
      required: false,
      nullable: true)
  final bool debugShowCheckedModeBanner;

  @JsonKey(
      defaultValue: false,
      disallowNullValue: true,
      required: false,
      nullable: true)
  final bool showPerformanceOverlay;

  @JsonKey(
      defaultValue: false,
      disallowNullValue: true,
      required: false,
      nullable: true)
  final bool showSemanticsDebugger;

  @JsonKey(
      defaultValue: false,
      disallowNullValue: true,
      required: false,
      nullable: true)
  final bool remoteConfigDebugMode;

  AppModel(
      {this.title,
      this.debugPaintSizeEnabled,
      this.debugPaintPointersEnabled,
      this.debugShowCheckedModeBanner,
      this.showPerformanceOverlay,
      this.showSemanticsDebugger,
      this.remoteConfigDebugMode});

  factory AppModel.fromJson(Map<String, dynamic> json) =>
      _$AppModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppModelToJson(this);
}
