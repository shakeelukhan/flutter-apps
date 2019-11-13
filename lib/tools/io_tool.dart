import 'dart:async';
import 'dart:convert';
import 'package:built_value/serializer.dart';
import 'package:flutter/services.dart';
import 'package:rishtaaunty/data/data.dart' as d;

class IoUtil {
  Object deserialize(Object serialized,
          [FullType specifiedType = FullType.unspecified]) =>
      d.serializers.deserialize(serialized, specifiedType: specifiedType);

  Future<String> getAssetString(String key, [_cache = true]) =>
      rootBundle.loadString(key, cache: _cache);

  Object serialize(Object object,
          [FullType specifiedType = FullType.unspecified]) =>
      d.serializers.serialize(object, specifiedType: specifiedType);

  Future sleepFuture(int seconds) => Future.delayed(Duration(seconds: seconds));

  dynamic stringToJson(String source) => jsonDecode(source);

  String jsonToString(Object object) => jsonEncode(object);
}

final IoUtil ioUtil = IoUtil();
