import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

class IoUtil {
  Future<String> getAssetString(String key, [_cache = true]) =>
      rootBundle.loadString(key, cache: _cache);
  Future sleepFuture(int seconds) => Future.delayed(Duration(seconds: seconds));
  dynamic stringToJson(String source) => jsonDecode(source);
  String jsonToString(Object object) => jsonEncode(object);
}

final IoUtil ioUtil = IoUtil();
