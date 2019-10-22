import 'package:json_annotation/json_annotation.dart';
import 'package:rishtaaunty/models/menu_model.dart';
import 'package:rishtaaunty/models/base_model.dart';

part 'app_model2.g.dart';

@JsonSerializable(nullable: false)
class AppModel2 extends BaseModel {
  @JsonKey(defaultValue: 'NULL_TITLE', nullable: true)
  final String title;

  @JsonKey(defaultValue: false, nullable: true)
  final bool debugPaintSizeEnabled;

  @JsonKey(defaultValue: false, nullable: true)
  final bool debugPaintPointersEnabled;

  @JsonKey(defaultValue: false, nullable: true)
  final bool debugShowCheckedModeBanner;

  @JsonKey(defaultValue: false, nullable: true)
  final bool showPerformanceOverlay;

  @JsonKey(defaultValue: false, nullable: true)
  final bool showSemanticsDebugger;

  @JsonKey(defaultValue: false, nullable: true)
  final bool remoteConfigDebugMode;

  @JsonKey(nullable: true)
  final List<MenuModel> menuList;

  AppModel2(
      {this.title,
      this.debugPaintSizeEnabled,
      this.debugPaintPointersEnabled,
      this.debugShowCheckedModeBanner,
      this.showPerformanceOverlay,
      this.showSemanticsDebugger,
      this.remoteConfigDebugMode,
      this.menuList});

  factory AppModel2.fromJson(Map<String, dynamic> json) =>
      _$AppModel2FromJson(json);

  Map<String, dynamic> toJson() => _$AppModel2ToJson(this);
}
