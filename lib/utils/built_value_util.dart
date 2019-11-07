import 'package:flutter/foundation.dart';
import 'package:json2builtvalue/json2builtvalue.dart';
import 'package:rishtaaunty/utils/utils.dart';

class BuiltValueUtil {
  Parser _parser;

  BuiltValueUtil({Parser parser}) {
    _parser = parser ?? Parser();
  }

  String getStringCode(String jsonString, [String topLevelName = 'TopLevel']) =>
      _parser.parse(jsonString, topLevelName);

  Future<String> getAssetCode(String jsonAssetKey,
          [String topLevelName = 'TopLevel']) async =>
      getStringCode(await io.getAssetString(jsonAssetKey), topLevelName);

  void printAssetCode(
          [String jsonAssetKey = 'assets/built_value_temp.json']) async =>
      debugPrint(await getAssetCode(jsonAssetKey));
}

final BuiltValueUtil builtValueUtil = BuiltValueUtil();
