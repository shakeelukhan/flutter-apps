part of '../blocs/app_bloc.dart';

abstract class AppEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AppEventStartup extends AppEvent {}

class AppEventUpdate extends AppEvent {}
