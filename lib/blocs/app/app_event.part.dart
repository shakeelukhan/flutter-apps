part of 'package:rishtaaunty/blocs/app/app_bloc.dart';

mixin AppEvent on EquatableMixin, BaseEvent<AppEvent> {
  initAppEvent() {
    LoggerUtils.logger.i('E1');
    initBaseEvent();
  }

  @override
  List<Object> get props => super.props..addAll([]);
}

class AppEventStartup extends BaseEventStartup<AppEvent>
    with EquatableMixin, AppEvent {
  AppEventStartup() {
    LoggerUtils.logger.i('F1');
    initAppEvent();
//    LoggerUtils.logger.i(this.props.toList().toString());
    LoggerUtils.logger.i('F2');
  }
}
/*
class AppEventUpdate extends BaseEventUpdate<AppEvent>
    with EquatableMixin, AppEvent {}
*/