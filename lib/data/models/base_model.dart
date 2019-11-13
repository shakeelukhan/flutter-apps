import 'package:built_value/serializer.dart';
import 'package:rishtaaunty/tools/tools.dart' as t;

abstract class BaseModel<M> {
  BaseModel();

  FullType getSpecifiedType() => FullType(M);

  Map toJson() => t.io.serialize(this, getSpecifiedType());

  String toJsonString() => t.io.jsonToString(toJson());
}
