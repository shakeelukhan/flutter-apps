import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:rishtaaunty/data/data.dart' as d;
import 'package:rishtaaunty/tools/tools.dart' as t;

abstract class BaseBloc<M extends d.BaseModel>
    extends Bloc<BaseEvent<M>, BaseState<M>> {
  @override
  BaseState<M> get initialState => BaseStateNew<M>();

  @override
  Stream<BaseState<M>> mapEventToState(BaseEvent<M> event) async* {
    final BaseState<M> oldState = currentState;

    try {
      if (event is BaseEventFetchData<M>) {
        yield BaseStateUpdating<M>();
        dispatch(BaseEventProcessData<M>(await fetchData()));
      } else if (event is BaseEventProcessData<M>) {
        yield BaseStateUpdating<M>();
        processData(event.data);
        yield BaseStateReady<M>(event.data);
      }
    } on Exception catch (error) {
      yield BaseStateError<M>(error);
    }

    t.log.logger.i(
        '${event?.toString()}: ${oldState?.runtimeType} -> ${currentState?.runtimeType}');
  }

  FutureOr<M> fetchData() => null;

  void processData(M _data) => null;
}

abstract class BaseEvent<M extends d.BaseModel> {}

class BaseEventFetchData<M extends d.BaseModel> extends BaseEvent<M> {}

class BaseEventProcessData<M extends d.BaseModel> extends BaseEvent<M> {
  final M data;
  BaseEventProcessData(this.data);
}

abstract class BaseState<M extends d.BaseModel> {}

class BaseStateNew<M extends d.BaseModel> extends BaseState<M> {}

class BaseStateUpdating<M extends d.BaseModel> extends BaseState<M> {}

class BaseStateReady<M extends d.BaseModel> extends BaseState<M> {
  final M data;
  BaseStateReady(this.data);
}

class BaseStateError<M extends d.BaseModel> extends BaseState<M> {
  Exception error;

  BaseStateError(this.error) {
    t.log.logger.e('WidgetStateError: $error');
  }
}
