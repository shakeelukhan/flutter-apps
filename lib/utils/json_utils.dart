import 'dart:convert';
import 'package:flutter/services.dart';

class JsonUtils {
  JsonUtils._();
  static final JsonUtils _jsonUtils = JsonUtils._();
  factory JsonUtils() => _jsonUtils;

  dynamic stringToJson(String source) => jsonDecode(source);
  String jsonToString(Object object) => jsonEncode(object);
  Future<String> assetToString(String key) => rootBundle.loadString(key);
  dynamic assetToJson(String key) async =>
      stringToJson(await this.assetToString(key));
}
