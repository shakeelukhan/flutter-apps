import 'package:built_value/serializer.dart';
import 'package:rishtaaunty/utils/utils.dart' as u;

abstract class BaseModel<M> {
  BaseModel();

  FullType getSpecifiedType() => FullType(M);

  Map toJson() => u.io.serialize(this, getSpecifiedType());

  String toJsonString() => u.io.jsonToString(toJson());
}
