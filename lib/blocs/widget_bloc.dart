import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:rishtaaunty/repositories/repositories.dart' as r;
import 'package:rishtaaunty/utils/utils.dart';
import 'package:rishtaaunty/widgets/widgets.dart' as w;
part './widget_bloc.event.dart';
part './widget_bloc.state.dart';

class WidgetBloc<T> extends Bloc<WidgetEvent, WidgetState<T>> {
  WidgetBloc({@required this.repository});

  w.BlocWidget<T> _widget;
  w.BlocWidget<T> get widget => _widget;
  r.BaseRepository<T> repository;

  @override
  WidgetState<T> get initialState => WidgetNewState();

  @override
  Stream<WidgetState<T>> mapEventToState(WidgetEvent event) async* {
    final WidgetState oldState = currentState;
    if (event is WidgetStartupEvent) {
      yield WidgetNewState<T>();
      dispatch(WidgetUpdateEvent());
    }
    if (event is WidgetUpdateEvent) {
      yield WidgetUpdatingState<T>();
      try {
        yield WidgetReadyState<T>(await this.repository.read());
      } on Exception catch (error) {
        yield WidgetErrorState<T>(error);
        u.log.logger.e('mapEventToState EXCEPTION: $error');
      }
    }
    u.log.logger.w(
        '${event?.runtimeType}: ${oldState?.runtimeType} -> ${currentState?.runtimeType}');
  }

  getWidget(Widget widget) =>
      _widget = w.BlocWidget<T>(bloc: this, widget: widget);
}
