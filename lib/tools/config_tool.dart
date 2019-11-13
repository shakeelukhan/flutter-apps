import 'package:rishtaaunty/data/data.dart' as d;
import 'io_tool.dart';

class ConfigUtil {
  Future<d.ConfigModel> _config;
  Future<d.ConfigModel> get config => _config;

  ConfigUtil([String assetKey = 'assets/config.json']) {
    _config = _getConfig(assetKey);
  }

  Future<d.ConfigModel> _getConfig(String assetKey) async =>
      _config = Future<d.ConfigModel>.value(d.ConfigModel.fromJson(
          ioUtil.stringToJson(await ioUtil.getAssetString(assetKey))));

  Future<d.BaseDatasource> getAppDatasource(String name) async =>
      (await _config).appDatasources[name];
}

final ConfigUtil configUtil = ConfigUtil();
