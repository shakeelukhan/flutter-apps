import 'package:meta/meta.dart';
import 'package:path/path.dart';
import '../datasources/asset_datasource.dart';
import '../datasources/base_datasource.dart';
import '../datasources/remote_config_datasource.dart';
import './base_repository.dart';

class AppRepository extends BaseRepository {
  final bool local;
  BaseDatasource _datasource;

  BaseDatasource get datasource => _datasource;

  AppRepository({@required String name, this.local = true, bool cache = true})
      : super(name: name, cache: cache) {
    this._datasource = _getDatasource();
  }

  String _nameToAssetKey(String name) =>
      setExtension(join('assets', name), '.json');

  String _nameToRemoteConfigKey(String name) => name;

  BaseDatasource _getDatasource() => _datasource = (local == true)
      ? AssetDatasource(key: _nameToAssetKey(name), cache: this.cache)
      : RemoteConfigDatasource(
          key: _nameToRemoteConfigKey(name), cache: this.cache);

  Future<dynamic> getData() => _datasource.getJson();
}
