part of 'menu_bloc.dart';

abstract class MenuState extends Equatable {
  @override
  List<Object> get props => [];
}

class MenuStateNew extends MenuState {}

class MenuStateUpdating extends MenuState {}

class MenuStateUpdated extends MenuState {}

class MenuStateError extends MenuState {
  final Exception error;
  MenuStateError(this.error);

  @override
  List<Object> get props => super.props..addAll([error]);
}
