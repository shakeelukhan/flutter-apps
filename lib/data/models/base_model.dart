import 'package:built_value/serializer.dart';
import 'package:rishtaaunty/utils/utils.dart' as u;
import 'serializers.dart';

abstract class BaseModel<T> {
  Map toJson() => serializers.serialize(this, specifiedType: FullType(T));

  String toJsonString() => u.io.jsonToString(toJson());

  static T fromJson<T>(Map json) =>
      serializers.deserialize(json, specifiedType: FullType(T));

  static T fromJsonString<T>(String jsonString) =>
      fromJson<T>(u.io.stringToJson(jsonString));
}
