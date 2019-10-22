import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:rishtaaunty/models.dart';

class SerializerUtils {
  SerializerUtils._();
  static final SerializerUtils _serializerUtils = SerializerUtils._();
  factory SerializerUtils() => _serializerUtils;

  Serializers _serializers =
      (modelSerializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
  Serializers get serializers => _serializers;

  T deserialize<T>(dynamic value) =>
      _serializers.deserializeWith<T>(_serializers.serializerForType(T), value);
}
