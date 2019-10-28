import 'package:built_value/serializer.dart';
import './widgets/app_widget_model.dart';
import './widgets/menu_widget_model.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  AppWidgetModel,
  MenuWidgetModel,
])
final Serializers modelSerializers = _$modelSerializers;
