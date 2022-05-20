import 'package:built_value/serializer.dart';
import 'package:flutter/foundation.dart';
import 'package:json2builtvalue/json2builtvalue.dart';
import 'package:rishtaaunty/data/data.dart' as d;
import 'io_tool.dart';

import 'dart:async';

class BuiltValueUtil {
  Parser _parser;

  BuiltValueUtil({Parser parser}) {
    _parser = parser ?? Parser();
  }

  Object deserialize(Object serialized,
          [FullType specifiedType = FullType.unspecified]) =>
      d.serializers.deserialize(serialized, specifiedType: specifiedType);

  Object serialize(Object object,
          [FullType specifiedType = FullType.unspecified]) =>
      d.serializers.serialize(object, specifiedType: specifiedType);

  String getStringCode(String jsonString, [String topLevelName = 'TopLevel']) =>
      _parser.parse(jsonString, topLevelName);

  Future<String> getAssetCode(String jsonAssetKey,
          [String topLevelName = 'TopLevel']) async =>
      getStringCode(await ioUtil.getAssetString(jsonAssetKey), topLevelName);

  void printAssetCode(
          [String jsonAssetKey = 'assets/built_value_temp.json']) async =>
      debugPrint(await getAssetCode(jsonAssetKey));
}

final BuiltValueUtil builtValueUtil = BuiltValueUtil();
