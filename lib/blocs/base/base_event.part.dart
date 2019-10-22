part of 'package:rishtaaunty/blocs/widget_bloc.dart';

mixin BaseEvent<T> {
  initBaseEvent<T>() {
    LoggerUtils.Logger.i('A1');
  }

  @override
  List<Object> get props => this.props..addAll([]);
}

class BaseEventStartup<T> with BaseEvent<T> {
  initBaseEventNew<T>() {
    LoggerUtils.Logger.i('B1');
  }

  BaseEventStartup() {
    LoggerUtils.Logger.i('B2');
  }
}
/*
class BaseEventUpdate<T> with EquatableMixin, BaseEvent<T> {
  baseEventUpdate() => baseEvent();

  @override
  List<Object> get props => super.props..addAll([]);
}
 */
