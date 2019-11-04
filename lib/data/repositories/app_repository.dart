import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;
import 'package:rishtaaunty/utils/utils.dart' as u;
import '../datasources/base_datasource.dart';
import '../datasources/asset_datasource.dart';
import '../datasources/remote_config_datasource.dart';
import './base_repository.dart';

class AppRepository extends BaseRepository {
  final bool local;
  BaseDatasource _datasource;
  Map<String, dynamic> _data;

  BaseDatasource get datasource => _datasource;
  Map<String, dynamic> get data => _data;

  AppRepository(
      {@required String appName, bool cache = true, this.local = true})
      : super(name: appName, cache: cache) {
    this._datasource = _getDatasource();
  }

  String _nameToAssetKey(String appName) =>
      p.setExtension(p.join('assets', appName), '.json');

  String _nameToRemoteConfigKey(String appName) => appName;

  BaseDatasource _getDatasource() => _datasource = (local == true)
      ? AssetDatasource(assetKey: _nameToAssetKey(name), cache: this.cache)
      : RemoteConfigDatasource(
          remoteConfigKey: _nameToRemoteConfigKey(name), cache: this.cache);

  Future<Map<String, dynamic>> getData() async =>
      _data = await _datasource.getJson();
}
