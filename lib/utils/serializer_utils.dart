import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:rishtaaunty/models/models.dart';

class SerializerUtils {
  SerializerUtils._();

  static Serializers _serializers =
      (modelSerializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
  static Serializers get serializers => _serializers;

  static T deserialize<T>(dynamic value) =>
      _serializers.deserializeWith<T>(_serializers.serializerForType(T), value);
}
