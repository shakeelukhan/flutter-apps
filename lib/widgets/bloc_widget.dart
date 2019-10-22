import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rishtaaunty/blocs.dart';
import 'package:rishtaaunty/models.dart';
import 'package:rishtaaunty/utils.dart';
import 'package:rishtaaunty/widgets.dart';

class BlocWidget<T extends WidgetModel> extends StatefulWidget {
  BlocWidget({Key key, @required this.bloc, @required this.widget})
      : super(key: key);

  final WidgetBloc<T> bloc;
  final Widget widget;
  @override
  _BlocWidgetState<T> createState() => _BlocWidgetState<T>();
}

class _BlocWidgetState<T extends WidgetModel> extends State<BlocWidget<T>> {
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    widget?.bloc?.dispatch(WidgetStartupEvent());
  }

  @override
  void dispose() {
    widget?.bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _refreshCompleter?.complete();
    _refreshCompleter = Completer();
    return BlocProvider.value(
        value: widget.bloc,
        child: BlocBuilder<WidgetBloc<T>, WidgetState<T>>(
            bloc: widget.bloc,
            condition: (previousState, state) {
              bool condition =
                  state?.runtimeType != previousState?.runtimeType ||
                      previousState?.data != state?.data;
              U.log.logger.i(
                  'BlocBuilder: C=${condition} previousState=${previousState?.runtimeType} state=${state?.runtimeType}');
              return condition;
            },
            builder: (context, state) {
              U.log.logger.i('BlocBuilder: S=${state?.runtimeType}');
              Widget _widget;
              if (state is WidgetNewState<T>) {
                _widget = W.stateful.app(W.stateful.scaffold(
                    W.stateless.center(W.stateful.circularProgress())));
              } else if (state is WidgetUpdatingState<T>) {
                _widget = W.stateful.app(
                  W.stateful.scaffold(
                    W.stateless.center(W.stateless.text('Updating...')),
                  ),
                );
              } else if (state is WidgetReadyState<T>) {
                _widget = W.stateful.app(
                  W.stateful.scaffold(
                    W.stateless.center(widget.widget),
                  ),
                );
                T data = state.data;
                print(data);
                //print(utilSerializer.serializers.deserialize(data));
                /*
            // Everything is serializable.
  for (var object in [
    value,
    value2,
    value3,
    value4,
    value5,
    value6,
    value7,
    value8,
    modifiedAnimals[0],
    modifiedAnimals[1],
  ]) {
    var serialized = serializers.serialize(object);
    print(serialized);
    assert(serializers.deserialize(serialized) == object);
  }
            * */
              }
              return BlocProvider(
                  builder: (BuildContext context) => widget.bloc,
                  child: _widget);
            }));
  }
}
