import 'dart:convert';
import 'package:flutter/services.dart';

class JsonUtils {
  JsonUtils._();
  factory JsonUtils({bool debugMode}) {
    return _jsonUtils;
  }

  static final JsonUtils _jsonUtils = JsonUtils._();
  static Future<String> assetToString(asset) => rootBundle.loadString(asset);
  static dynamic stringToJson(String jsonString) => jsonDecode(jsonString);
}
