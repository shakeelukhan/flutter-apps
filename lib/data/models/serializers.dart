import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import './page_models/app_page_model.dart';
part 'serializers.g.dart';

@SerializersFor(const [AppPageModel])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
