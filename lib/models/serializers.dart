import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import './widget_models/app_widget_model.dart';
import './widget_models/menu_widget_model.dart';
part 'serializers.g.dart';

@SerializersFor(const [
  AppWidgetModel,
  MenuWidgetModel,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
