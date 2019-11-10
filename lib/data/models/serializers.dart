import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import './app_models/app_model.dart';
import './app_models/app_page_model.dart';
import './app_models/app_source_model.dart';
import './app_models/app_sources_model.dart';
part 'serializers.g.dart';

@SerializersFor(const [
  AppModel,
  AppPageModel,
  AppSourceModel,
  AppSourcesModel,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
