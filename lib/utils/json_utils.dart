import 'dart:convert';

final JsonUtils jsonUtils = JsonUtils();

class JsonUtils {
  dynamic stringToJson(String source) => jsonDecode(source);
  String jsonToString(Object object) => jsonEncode(object);
}
