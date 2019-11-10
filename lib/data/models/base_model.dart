import 'package:built_value/serializer.dart';
import 'package:rishtaaunty/utils/utils.dart' as u;
import './serializers.dart';

abstract class BaseModel<M> {
  BaseModel();
  static fromJson(Map json, FullType specifiedType) =>
      serializers.deserialize(json, specifiedType: specifiedType);

  FullType getSpecifiedType() => FullType(M);

  Map toJson() =>
      serializers.serialize(this, specifiedType: getSpecifiedType());

  String toJsonString() => u.io.jsonToString(toJson());
}
