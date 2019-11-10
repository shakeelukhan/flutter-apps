import 'package:rishtaaunty/data/data.dart' as d;
import './base_bloc.dart';

class AppBloc extends BaseBloc<d.AppModel> {
  final d.AppRepository repository;

  AppBloc.fromRepository(this.repository);

  AppBloc.fromConfig(String name, {bool local = true, bool cache = true})
      : repository = d.AppRepository(name, local: local, cache: cache);

  Future<d.AppModel> getData() async => repository.getData();
}
