import 'package:json2builtvalue/json2builtvalue.dart';
import 'package:meta/meta.dart';
import './asset_utils.dart';

class BuiltValueUtils {
  String parseJsonString(
          {@required String jsonString, String topLevelName = 'TopLevel'}) =>
      Parser().parse(jsonString, topLevelName);

  Future<String> parseJsonAsset(String key) async =>
      parseJsonString(jsonString: await assetUtils.assetToString(key));

  void printParsedJsonAsset(
          [String key = 'assets/built_value_temp.json']) async =>
      print(await parseJsonAsset(key));
}

final BuiltValueUtils builtValueUtils = BuiltValueUtils();
