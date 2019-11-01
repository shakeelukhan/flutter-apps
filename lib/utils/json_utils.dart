import 'dart:convert';

class JsonUtils {
  dynamic stringToJson(String source) => jsonDecode(source);
  String jsonToString(Object object) => jsonEncode(object);
}

final JsonUtils jsonUtils = JsonUtils();
