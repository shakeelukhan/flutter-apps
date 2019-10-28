import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:rishtaaunty/models/models.dart';
import './json_utils.dart';

final SerializerUtils serializerUtils = SerializerUtils();

class SerializerUtils {
  Serializers _serializers;
  Serializers get serializers => _serializers;

  SerializerUtils({Serializers serializers}) {
    _serializers = serializers ??
        (modelSerializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
  }

  Object serialize(Object value) => _serializers.serialize(value);
  Object serializeWith<T>(Object value) =>
      _serializers.serializeWith<T>(_serializers.serializerForType(T), value);

  Object deserializeJson(dynamic value) => _serializers.deserialize(value);
  Object deserializeString(dynamic value) =>
      _serializers.deserialize(jsonUtils.stringToJson(value));
  T deserializeJsonWith<T>(dynamic value) =>
      _serializers.deserializeWith<T>(_serializers.serializerForType(T), value);
}
