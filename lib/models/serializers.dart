import 'package:built_value/serializer.dart';
import './widgets/app_widget_model.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  AppWidgetModel,
])
final Serializers modelSerializers = _$modelSerializers;
