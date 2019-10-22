part of './widget_bloc.dart';

abstract class WidgetState<T> {
  WidgetState(this.data);
  final T data;
}

class WidgetNewState<T> extends WidgetState<T> {
  WidgetNewState() : super(null);
}

class WidgetUpdatingState<T> extends WidgetState<T> {
  WidgetUpdatingState() : super(null);
}

class WidgetReadyState<T> extends WidgetState<T> {
  WidgetReadyState(T data) : super(data);
}

class WidgetErrorState<T> extends WidgetState<T> {
  WidgetErrorState(this.error) : super(null);
  Exception error;
}
