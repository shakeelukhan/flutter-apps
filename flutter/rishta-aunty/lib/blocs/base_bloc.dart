import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rishta_aunty/data/data.dart' as d;
import 'package:rishta_aunty/tools/tools.dart' as t;

// Migrated from the pre-rewrite `bloc` package API (initialState getter,
// mapEventToState()/yield, dispatch(), currentState) to the current
// on<Event> handler API (constructor-registered handlers, emit(), add(),
// state). Behavior preserved: fetch -> updating -> ready/error, with the
// same logging line after each event.
abstract class BaseBloc<M extends d.BaseModel>
    extends Bloc<BaseEvent<M>, BaseState<M>> {
  BaseBloc() : super(BaseStateNew<M>()) {
    on<BaseEventFetchData<M>>(_onFetchData);
    on<BaseEventProcessData<M>>(_onProcessData);
  }

  Future<void> _onFetchData(
      BaseEventFetchData<M> event, Emitter<BaseState<M>> emit) async {
    final oldState = state;
    try {
      emit(BaseStateUpdating<M>());
      add(BaseEventProcessData<M>(await fetchData()));
    } on Exception catch (error) {
      emit(BaseStateError<M>(error));
    }
    t.log.logger
        .i('$event: ${oldState.runtimeType} -> ${state.runtimeType}');
  }

  Future<void> _onProcessData(
      BaseEventProcessData<M> event, Emitter<BaseState<M>> emit) async {
    final oldState = state;
    try {
      emit(BaseStateUpdating<M>());
      processData(event.data);
      emit(BaseStateReady<M>(event.data));
    } on Exception catch (error) {
      emit(BaseStateError<M>(error));
    }
    t.log.logger
        .i('$event: ${oldState.runtimeType} -> ${state.runtimeType}');
  }

  FutureOr<M?> fetchData() => null;

  void processData(M? data) {}
}

abstract class BaseEvent<M extends d.BaseModel> {}

class BaseEventFetchData<M extends d.BaseModel> extends BaseEvent<M> {}

class BaseEventProcessData<M extends d.BaseModel> extends BaseEvent<M> {
  final M? data;
  BaseEventProcessData(this.data);
}

abstract class BaseState<M extends d.BaseModel> {}

class BaseStateNew<M extends d.BaseModel> extends BaseState<M> {}

class BaseStateUpdating<M extends d.BaseModel> extends BaseState<M> {}

class BaseStateReady<M extends d.BaseModel> extends BaseState<M> {
  final M? data;
  BaseStateReady(this.data);
}

class BaseStateError<M extends d.BaseModel> extends BaseState<M> {
  final Exception error;

  BaseStateError(this.error) {
    t.log.logger.e('WidgetStateError: $error');
  }
}
