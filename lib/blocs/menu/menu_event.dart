part of 'menu_bloc.dart';

abstract class MenuEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class MenuEventStartup extends MenuEvent {}

class MenuEventUpdate extends MenuEvent {}

class MenuEventTap extends MenuEvent {}
