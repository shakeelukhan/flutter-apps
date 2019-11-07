import 'package:rishtaaunty/data/data.dart' as d;
import './page_bloc.dart';

class AppBloc extends PageBloc<d.AppRepository> {
  AppBloc.fromRepository(d.AppRepository repository)
      : super.fromRepository(repository);
  AppBloc.fromConfig(String name, [bool local = true, bool cache = true])
      : super.fromRepository(
            d.AppRepository(name: name, local: local, cache: cache));
}
