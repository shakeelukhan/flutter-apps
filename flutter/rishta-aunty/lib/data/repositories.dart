import 'dart:async';
import 'models/app_models.dart';
import 'models/base_model.dart';
import 'models/datasource_models.dart';

final ConfigRepository configRepository = ConfigRepository();

abstract class BaseRepository<M extends BaseModel> {
  final String? name;
  final FutureOr<BaseDatasourceModel>? datasource;
  M? data;

  BaseRepository(this.name, this.datasource);

  Future<M?> getData() async {
    final ds = datasource;
    if (ds == null) return null;
    return data = BaseModel.fromJson<M>(await (await ds).getJson());
  }
}

class ConfigRepository extends BaseRepository<ConfigModel> {
  ConfigRepository([BaseDatasourceModel? datasource])
      : super(
            null,
            datasource != null
                ? Future<BaseDatasourceModel>.value(datasource)
                : _getDefaultDatasource()) {
    getData();
  }

  static Future<AssetDatasourceModel> _getDefaultDatasource() async =>
      AssetDatasourceModel.fromArgs('assets/config.json');
}

class AppRepository extends BaseRepository<AppModel> {
  AppRepository(String name) : super(name, null);

  @override
  Future<AppModel?> getData() async {
    final config = await configRepository.getData();
    final appDatasource = config?.apps[name];
    if (appDatasource == null) return null;
    return data = AppModel.fromJson(await appDatasource.getJson());
  }
}
