import 'package:built_value/serializer.dart';
import 'app_model.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  AppModel,
])
final Serializers modelSerializers = _$modelSerializers;
