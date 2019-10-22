import 'package:json_annotation/json_annotation.dart';
import 'package:rishtaaunty/models/widget_model.dart';

part 'menu_model.g.dart';

@JsonSerializable(nullable: false)
class MenuModel extends WidgetModel {
  @JsonKey(defaultValue: 'TAB', nullable: true)
  final String title;

  @JsonKey(defaultValue: 0xe87d, nullable: true)
  final int codePoint;

  @JsonKey(defaultValue: 'MaterialIcons', nullable: true)
  String fontFamily;

  MenuModel({this.title, this.codePoint, this.fontFamily});

  factory MenuModel.fromJson(Map<String, dynamic> json) =>
      _$MenuModelFromJson(json);

  Map<String, dynamic> toJson() => _$MenuModelToJson(this);
}
