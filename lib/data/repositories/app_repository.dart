import 'package:path/path.dart';
import '../models/app_models/app_model.dart';
import '../datasources/asset_datasource.dart';
import '../datasources/base_datasource.dart';
import '../datasources/remote_config_datasource.dart';
import './base_repository.dart';

class AppRepository extends BaseRepository<AppModel> {
  final bool local;
  BaseDatasource _datasource;

  BaseDatasource get datasource => _datasource;

  AppRepository(String name, {this.local = true, bool cache = true})
      : super(name, cache: cache) {
    this._datasource = _getDatasource();
  }

  String _nameToAssetKey(String name) =>
      setExtension(join('assets', name), '.json');

  String _nameToRemoteConfigKey(String name) => name;

  BaseDatasource _getDatasource() => _datasource = (local == true)
      ? AssetDatasource(_nameToAssetKey(name), cache: this.cache)
      : RemoteConfigDatasource(_nameToRemoteConfigKey(name), cache: this.cache);

  Future<AppModel> getData() async =>
      AppModel.fromJson(await _datasource.getJson());
}
