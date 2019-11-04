import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rishtaaunty/blocs/blocs.dart' as b;
import 'package:rishtaaunty/models/models.dart' as m;
import 'package:rishtaaunty/utils/utils.dart' as u;
import 'package:rishtaaunty/widgets/widgets.dart' as w;

class BlocWidget<T extends m.BaseWidgetModel> extends StatefulWidget {
  BlocWidget({Key key, @required this.bloc, @required this.widget})
      : super(key: key);

  final b.WidgetBloc<T> bloc;
  final Widget widget;
  @override
  _BlocWidgetState<T> createState() => _BlocWidgetState<T>();
}

class _BlocWidgetState<T extends m.BaseWidgetModel>
    extends State<BlocWidget<T>> {
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    widget?.bloc?.dispatch(b.WidgetStartupEvent());
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
        child: BlocBuilder<b.WidgetBloc<T>, b.WidgetState<T>>(
            bloc: widget.bloc,
            condition: (previousState, state) {
              bool condition =
                  state?.runtimeType != previousState?.runtimeType ||
                      previousState?.data != state?.data;
              u.log.logger.i(
                  'BlocBuilder: C=$condition previousState=${previousState?.runtimeType} state=${state?.runtimeType}');
              return condition;
            },
            builder: (context, state) {
              u.log.logger.i('BlocBuilder: S=${state?.runtimeType}');
              Widget _widget;
              if (state is b.WidgetNewState<T>) {
                _widget = w.StatefulWidgets.app(w.StatefulWidgets.scaffold(
                    w.StatelessWidgets.center(
                        w.StatefulWidgets.circularProgress())));
              } else if (state is b.WidgetUpdatingState<T>) {
                _widget = w.StatefulWidgets.app(
                  w.StatefulWidgets.scaffold(
                    w.StatelessWidgets.center(
                        w.StatelessWidgets.text('Updating...')),
                  ),
                );
              } else if (state is b.WidgetReadyState<T>) {
                _widget = BlocProvider(
                    builder: (BuildContext context) => widget.bloc,
                    child: widget.widget);
              }
              //   _widget = AppWidget(appData: state.data);
              return _widget;
            }));
  }
}
