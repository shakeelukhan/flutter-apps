import 'package:rishtaaunty/models.dart';
import 'package:rishtaaunty/repositories.dart';
import 'blocs/widget_bloc.dart';
export 'blocs/widget_bloc.dart';

class B {
  B._();
  static widgetBloc<T extends WidgetModel>(BaseRepository repository) =>
      WidgetBloc<T>(repository: repository);
}