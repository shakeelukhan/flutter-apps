import 'package:rishtaaunty/utils/utils.dart' as u;
import '../datasources/base_datasource.dart';
import '../models/app_models/app_model.dart';
import './base_repository.dart';

class AppRepository extends BaseRepository<AppModel> {
  Future<BaseDatasource> _datasource;
  Future<BaseDatasource> get datasource => _datasource;

  AppRepository(String name) : super(name) {
    _datasource = _getDatasource();
  }

  Future<BaseDatasource> _getDatasource() async =>
      _datasource = u.config.getAppDatasource(name);

  Future<AppModel> getData() async =>
      AppModel.fromJson(await (await _datasource).getJson());
}
