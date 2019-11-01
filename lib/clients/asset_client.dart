import 'dart:async';
import 'package:rishtaaunty/utils/utils.dart' as u;

class AssetClient {
  Completer _loadStringCompleter, _loadJsonCompleter;

  Future<String> loadString(String key) async {
    await _loadStringCompleter?.future;
    _loadStringCompleter = Completer<String>();
    _loadStringCompleter.complete(await u.asset.assetToString(key));
    return _loadStringCompleter.future;
  }

  Future<dynamic> loadJson(String key) async {
    await _loadJsonCompleter?.future;
    _loadJsonCompleter = Completer<dynamic>();
    _loadJsonCompleter
        .complete(await u.json.stringToJson(await loadString(key)));
    return _loadJsonCompleter.future;
  }
}

final AssetClient assetClient = AssetClient();
