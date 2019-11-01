import 'package:built_value/serializer.dart';
import 'package:rishtaaunty/utils/utils.dart' as u;
import '../serializers.dart';

abstract class BaseWidgetModel {
  Map toJson<T>() => serializers.serialize(this, specifiedType: FullType(T));

  String toJsonString<T>() => u.json.jsonToString(toJson<T>());

  static T fromJson<T>(Map json) =>
      serializers.deserialize(json, specifiedType: FullType(T));

  static T fromJsonString<T>(String jsonString) =>
      fromJson<T>(u.json.stringToJson(jsonString));
}
