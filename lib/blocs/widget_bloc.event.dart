part of './widget_bloc.dart';

abstract class WidgetEvent {}

class WidgetStartupEvent extends WidgetEvent {}

class WidgetUpdateEvent extends WidgetEvent {}
