part of 'base_bloc.dart';

mixin BaseState<T> {
  int baseStateInt;
  initBaseState() {
    LoggerUtils.logger.i('A1');
  }

  @override
  List<Object> get props => this.props..addAll([baseStateInt]);
}

class BaseStateNew<T> with BaseState<T> {
  int baseStateNewInt;
  initBaseStateNew() {
    LoggerUtils.logger.i('B1');
  }

  BaseStateNew() {
    LoggerUtils.logger.i('B2');
  }

  @override
  List<Object> get props => super.props..addAll([baseStateNewInt]);
}
/*
class BaseStateUpdating<T> extends BaseState<T> {
  baseStateUpdating() => baseState();

  @override
  List<Object> get props => super.props..addAll([]);
}

class BaseStateReady<T> extends BaseState<T> {
  baseStateReady() => baseState();

  BaseModel data;

  @override
  List<Object> get props => [data];
}

class BaseStateError<T> extends BaseState<T> {
  baseStateError() => baseState();

  Exception error;

  @override
  List<Object> get props => [error];
}
*/
