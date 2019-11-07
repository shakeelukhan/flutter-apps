import 'package:rishtaaunty/data/data.dart' as d;
import '../page_bloc.dart';

class AppBloc extends PageBloc<d.AppPageRepository> {
  AppBloc.fromRepository(d.AppPageRepository repository)
      : super.fromRepository(repository);
}
