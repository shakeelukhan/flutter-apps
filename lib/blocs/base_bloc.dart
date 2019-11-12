import 'package:bloc/bloc.dart';
import 'package:rishtaaunty/data/data.dart' as d;
import 'package:rishtaaunty/utils/utils.dart' as u;
import 'base_event.dart';
import 'base_state.dart';

abstract class BaseBloc<M extends d.BaseModel>
    extends Bloc<BaseEvent<M>, BaseState<M>> {
  @override
  BaseState<M> get initialState => BaseStateNew<M>();

  @override
  Stream<BaseState<M>> mapEventToState(BaseEvent<M> event) async* {
    final BaseState<M> oldState = currentState;
    if (event is BaseEventUpdate<M>) {
      yield BaseStateUpdating<M>();
      try {
        yield BaseStateReady<M>(await getData());
      } on Exception catch (error) {
        yield BaseStateError<M>(error);
      }
    }
    u.log.logger.i(
        '${event?.toString()}: ${oldState?.runtimeType} -> ${currentState?.runtimeType}');
  }

  Future<M> getData();
}
