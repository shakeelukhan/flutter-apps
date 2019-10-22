import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rishtaaunty/models/widget_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:rishtaaunty/models/widget_model.dart';
import 'package:rishtaaunty/utils.dart';

part 'package:rishtaaunty/blocs/widget_bloc.state.dart';
part 'package:rishtaaunty/events/widget_bloc.event.dart';
part 'package:rishtaaunty/pages/widget_bloc.dart';

class BaseBloc<S extends BaseEvent<S>, T extends BaseState<T>>
    extends Bloc<BaseEvent<S>, BaseState<T>> {
  @override
  BaseState<T> get initialState => BaseStateNew<T>();

  @override
  Stream<BaseState<T>> mapEventToState(BaseEvent<S> event) async* {
    LoggerUtils.Logger.i('EVENT_START=${event} STATE=${currentState}');
    if (event is BaseEventStartup<S>) {
      yield BaseStateNew<T>();
    }

    LoggerUtils.Logger.i('EVENT_END=${event} STATE=${currentState}');
  }
}
