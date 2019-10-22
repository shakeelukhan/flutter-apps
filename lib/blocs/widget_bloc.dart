import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:rishtaaunty/models.dart';
import 'package:rishtaaunty/repositories.dart';
import 'package:rishtaaunty/utils.dart';
import 'package:rishtaaunty/widgets.dart';
part './widget_bloc.event.dart';
part './widget_bloc.state.dart';

class WidgetBloc<T extends ModelWidget>
    extends Bloc<WidgetEvent, WidgetState<T>> {
  WidgetBloc({@required this.repository});

  BlocWidget<T> _widget;
  BlocWidget<T> get widget => _widget;
  BaseRepository<T> repository;

  @override
  WidgetState<T> get initialState => WidgetNewState();

  @override
  Stream<WidgetState<T>> mapEventToState(WidgetEvent event) async* {
    U.log.logger.i(
        'mapEventToState START: event=${event?.runtimeType} currentState=${currentState?.runtimeType}');
    if (event is WidgetStartupEvent) {
      yield WidgetNewState<T>();
      dispatch(WidgetUpdateEvent());
    }
    if (event is WidgetUpdateEvent) {
      yield WidgetUpdatingState<T>();
      try {
        final T data = await this.repository.read();
        yield WidgetReadyState<T>(data);
      } on Exception catch (error) {
        yield WidgetErrorState<T>(error);
        U.log.logger.e('mapEventToState EXCEPTION: $error');
      }
    }
    U.log.logger.i(
        'mapEventToState END: event=${event?.runtimeType} currentState=${currentState?.runtimeType}');
  }

  getWidget(Widget widget) =>
      _widget = BlocWidget<T>(bloc: this, widget: widget);
}
