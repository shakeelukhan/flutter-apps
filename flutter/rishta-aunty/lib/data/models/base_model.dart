import 'package:built_value/serializer.dart';
import 'package:rishta_aunty/tools/tools.dart' as t;

abstract class BaseModel<M> {
  BaseModel();

  FullType getSpecifiedType() => FullType(M);

  Object toJson() => t.builtValue.serialize(this, getSpecifiedType())!;

  String toJsonString() => t.io.jsonToString(toJson());

  static T fromJson<T>(Map json) =>
      t.builtValue.deserialize(json, FullType(T)) as T;
}
