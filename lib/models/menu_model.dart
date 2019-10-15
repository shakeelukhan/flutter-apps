import 'package:json_annotation/json_annotation.dart';

part 'menu_model.g.dart';

@JsonSerializable(nullable: false)
class MenuModel {
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

  MenuModel(
      {this.title,
        this.debugPaintSizeEnabled,
        this.debugPaintPointersEnabled,
        this.debugShowCheckedModeBanner,
        this.showPerformanceOverlay,
        this.showSemanticsDebugger,
        this.remoteConfigDebugMode});

  factory MenuModel.fromJson(Map<String, dynamic> json) =>
      _$MenuModelFromJson(json);

  Map<String, dynamic> toJson() => _$MenuModelToJson(this);
}
