part of 'package:rishtaaunty/blocs/base_bloc.dart';

// mixin BaseEvent<T> on EquatableMixin {
mixin BaseEvent<T> on EquatableMixin {
  initBaseEvent() {
    LoggerUtils.logger.i('A1');
  }

  @override
  List<Object> get props => this.props..addAll([]);
}

class BaseEventStartup<T> with EquatableMixin, BaseEvent<T> {
  initBaseEventNew() {
    LoggerUtils.logger.i('B1');
  }

  BaseEventStartup() {
    LoggerUtils.logger.i('B2');
  }}
/*
class BaseEventUpdate<T> with EquatableMixin, BaseEvent<T> {
  baseEventUpdate() => baseEvent();

  @override
  List<Object> get props => super.props..addAll([]);
}
 */
