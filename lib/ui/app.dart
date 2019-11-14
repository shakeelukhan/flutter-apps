import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rishtaaunty/blocs/blocs.dart' as b;
import 'package:rishtaaunty/data/data.dart' as d;
import 'widgets/app_widget.dart';
import 'widgets/bloc_widget.dart';
import 'widgets/dialog_widget.dart';

class App extends BlocWidget<d.AppModel> {
  App.fromBloc(b.AppBloc bloc, {Key key}) : super.fromBloc(bloc, key: key);
  App.fromConfig(String name, {Key key})
      : super.fromBloc(b.AppBloc.fromConfig(name), key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends BlocWidgetState<d.AppModel> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<b.AppBloc, b.BaseState<d.AppModel>>(
        bloc: bloc,
        condition: (previousState, state) => previousState != state,
        builder: (context, state) {
          d.AppModel _data;
          Widget _widget;

          if (state is b.BaseStateUpdating<d.AppModel> ||
              state is b.BaseStateNew<d.AppModel>) {
            _data = d.AppModel((b) => b.title = state.runtimeType.toString());
            _widget = AppWidget(_data, widget: DialogWidget(progress: true));
          }

          if (state is b.BaseStateReady<d.AppModel>) {
            _data = state.data;
            _widget = AppWidget(_data);
          }

          return BlocProvider.value(value: bloc, child: _widget);
        });
  }
}
