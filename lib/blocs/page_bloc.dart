import 'package:bloc/bloc.dart';
import 'package:rishtaaunty/data/data.dart' as d;
import 'package:rishtaaunty/utils/utils.dart' as u;

abstract class PageBloc<T extends d.BaseRepository>
    extends Bloc<PageEvent, PageState> {
  final T repository;

  PageBloc.fromRepository(this.repository);

  @override
  PageState get initialState => PageStateNew();

  @override
  Stream<PageState> mapEventToState(PageEvent event) async* {
    final PageState oldState = currentState;
    if (event == PageEvent.update) {
      yield PageStateUpdating();
      try {
        yield PageStateReady(await repository.getData());
      } on Exception catch (error) {
        yield PageStateError(error);
      }
    }
    u.log.logger.i(
        '${event?.toString()}: ${oldState?.runtimeType} -> ${currentState?.runtimeType}');
  }
}

enum PageEvent { update }

abstract class PageState {}

class PageStateNew extends PageState {}

class PageStateUpdating extends PageState {}

class PageStateReady extends PageState {
  final Map<String, dynamic> data;

  PageStateReady(this.data);
}

class PageStateError extends PageState {
  Exception error;

  PageStateError(this.error) {
    u.log.logger.e('WidgetStateError: $error');
  }
}
