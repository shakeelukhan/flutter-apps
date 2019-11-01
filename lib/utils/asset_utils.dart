import 'package:flutter/services.dart';
import './json_utils.dart';

class AssetUtils {
  Future<String> assetToString(String key) => rootBundle.loadString(key);
  dynamic assetToJson(String key) async =>
      jsonUtils.stringToJson(await assetToString(key));
}

final AssetUtils assetUtils = AssetUtils();
