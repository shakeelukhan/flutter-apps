import 'package:rishtaaunty/data/data.dart' as d;
import 'base_bloc.dart';

class AppBloc extends BaseBloc<d.AppModel> {
  d.AppRepository _repository;
  d.AppRepository get repository => _repository;

  AppBloc.fromConfig(String name) {
    this.getConfig(name);
  }

  void getConfig(String name) {
    this._repository = d.AppRepository(name);
    this.triggerUpdate();
  }

  Future<d.AppModel> getData() => _repository.getData();
}
