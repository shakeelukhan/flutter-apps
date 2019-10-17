part of 'package:rishtaaunty/blocs/app/app_bloc.dart';

mixin AppState on BaseState<AppState> {
  int appStateInt;
  initAppState() {
    LoggerUtils.logger.i('C1');
    initBaseState();
    LoggerUtils.logger.i('C2');
  }

  @override
  List<Object> get props => super.props..addAll([appStateInt]);
}

@override
class AppStateNew extends BaseStateNew<AppState> with AppState {
  int appStateNewInt;
  @override
  AppStateNew() {
    LoggerUtils.logger.i('D1');
    initAppState();
//    LoggerUtils.logger.i(this.props.toList().toString());
    LoggerUtils.logger.i('D2');
  }
  @override
  List<Object> get props => super.props..addAll([appStateNewInt]);
} /*
class AppStateUpdating extends BaseStateUpdating<AppState> with AppState{}
class AppStateReady extends BaseStateReady<AppState> with AppState {}
class AppStateError extends BaseStateError<AppState> with AppState {}*/
