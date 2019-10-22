part of 'package:rishtaaunty/blocs/app/app_widget.dart';

//  on EquatableMixin,
mixin AppEvent on BaseEvent<AppEvent> {
  initAppEvent() {
    LoggerUtils.Logger.i('E1');
    initBaseEvent();
  }

  @override
  List<Object> get props => super.props..addAll([]);
}

class AppEventStartup extends BaseEventStartup<AppEvent> with AppEvent {
  AppEventStartup() {
    LoggerUtils.Logger.i('F1');
    initAppEvent();
//    LoggerUtils.logger.i(this.props.toList().toString());
    LoggerUtils.Logger.i('F2');
  }
}
/*
class AppEventUpdate extends BaseEventUpdate<AppEvent>
    with EquatableMixin, AppEvent {}
*/
