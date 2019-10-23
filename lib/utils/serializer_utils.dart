import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:rishtaaunty/models/models.dart';
import './json_utils.dart';

class SerializerUtils {
  SerializerUtils._();

  static Serializers _serializers =
      (modelSerializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
  static Serializers get serializers => _serializers;

  static Object serializeWith<T>(Object value) =>
      _serializers.serializeWith<T>(_serializers.serializerForType(T), value);

  static Object serialize(Object value) => _serializers.serialize(value);

  static T deserializeJsonWith<T>(dynamic value) =>
      _serializers.deserializeWith<T>(_serializers.serializerForType(T), value);

  static Object deserializeJson(dynamic value) =>
      _serializers.deserialize(value);

  static Object deserializeString(dynamic value) =>
      _serializers.deserialize(JsonUtils.stringToJson(value));
}
