import 'package:json2builtvalue/json2builtvalue.dart';
import 'package:meta/meta.dart';
import './asset_utils.dart';

final BuiltValueUtils builtValue = BuiltValueUtils();

class BuiltValueUtils {
  String parseJsonString(
          {@required String jsonString, String topLevelName = 'TopLevel'}) =>
      Parser().parse(jsonString, topLevelName);

  // Example:
  //   print(await u.builtValue.parseJsonAsset('assets/built_value_temp.json'));
  Future<String> parseJsonAsset(String key) async {
    return parseJsonString(jsonString: await assetUtils.assetToString(key));
  }
}
