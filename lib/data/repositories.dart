import 'dart:async';
import 'models/app_models.dart';
import 'models/base_model.dart';
import 'models/datasource_models.dart';

final ConfigRepository configRepository = ConfigRepository();

abstract class BaseRepository<M extends BaseModel> {
  final String name;
  final FutureOr<BaseDatasourceModel> datasource;
  FutureOr<M> data;

  BaseRepository(this.name, this.datasource);

  FutureOr<M> getData() async => data = datasource == null
      ? null
      : BaseModel.fromJson<M>(await (await datasource).getJson());
}

class ConfigRepository extends BaseRepository<ConfigModel> {
  ConfigRepository([BaseDatasourceModel datasource])
      : super(null, datasource ?? _getDefaultDatasource()) {
    this.getData();
  }

  static Future<AssetDatasourceModel> _getDefaultDatasource() async =>
      AssetDatasourceModel.fromArgs('assets/config.json');
}

class AppRepository extends BaseRepository<AppModel> {
  AppRepository(String name) : super(name, null);

  @override
  Future<AppModel> getData() async => data = AppModel.fromJson(
      await (await configRepository.getData()).apps[name].getJson());
}
