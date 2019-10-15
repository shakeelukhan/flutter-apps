part of 'package:rishtaaunty/blocs/app/app_bloc.dart';

abstract class AppState extends Equatable {
  @override
  List<Object> get props => [];
}

class AppStateNew extends AppState {}

class AppStateUpdating extends AppState {}

class AppStateUpdated extends AppState {}

class AppStateError extends AppState {
  final Exception error;
  AppStateError(this.error);

  @override
  List<Object> get props => super.props..addAll([error]);
}
