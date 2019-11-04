import 'package:json2builtvalue/json2builtvalue.dart';
import 'package:rishtaaunty/data/data.dart';

class BuiltValueUtil {
  Parser _parser;

  BuiltValueUtil({Parser parser}) {
    _parser = parser ?? Parser();
  }

  String getStringCode(String jsonString, [String topLevelName = 'TopLevel']) =>
      _parser.parse(jsonString, topLevelName);

 /* Future<String> getAssetCode(String jsonAssetKey,
          [String topLevelName = 'TopLevel']) async =>
      getStringCode(await assetUtil.getString(jsonAssetKey), topLevelName);

  void printAssetCode(
          [String jsonAssetKey = 'assets/built_value_temp.json']) async =>
      print(await getAssetCode(jsonAssetKey)); */
}

final BuiltValueUtil builtValueUtil = BuiltValueUtil();
