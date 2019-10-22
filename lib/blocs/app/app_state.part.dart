part of 'package:rishtaaunty/blocs/app/app_widget.dart';

mixin AppState on BaseState<AppState> {
  int appStateInt;
  initAppState() {
    LoggerUtils.Logger.i('C1');
    initBaseState();
    LoggerUtils.Logger.i('C2');
  }

  @override
  List<Object> get props => super.props..addAll([appStateInt]);
}

@override
class AppStateNew extends BaseStateNew<AppState> with AppState {
  int appStateNewInt;
  @override
  AppStateNew() {
    LoggerUtils.Logger.i('D1');
    initAppState();
//    LoggerUtils.logger.i(this.props.toList().toString());
    LoggerUtils.Logger.i('D2');
  }
  @override
  List<Object> get props => super.props..addAll([appStateNewInt]);
} /*
class AppStateUpdating extends BaseStateUpdating<AppState> with AppState{}
class AppStateReady extends BaseStateReady<AppState> with AppState {}
class AppStateError extends BaseStateError<AppState> with AppState {}*/
