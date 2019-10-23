import 'dart:convert';
import 'package:flutter/services.dart';

class JsonUtils {
  JsonUtils._();

  static dynamic stringToJson(String source) => jsonDecode(source);
  static String jsonToString(Object object) => jsonEncode(object);
  static Future<String> assetToString(String key) => rootBundle.loadString(key);
  static dynamic assetToJson(String key) async =>
      stringToJson(await assetToString(key));
}
