import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rishtaaunty/blocs/blocs.dart' as b;
import 'package:rishtaaunty/data/data.dart' as d;
import 'package:rishtaaunty/pages/pages.dart' as p;
import 'package:rishtaaunty/widgets/widgets.dart' as w;

class App extends w.BlocWidget<d.AppModel> {
  App.fromBloc(b.AppBloc bloc, {Key key}) : super.fromBloc(bloc, key: key);
  App.fromRepository(d.AppRepository repository, {Key key})
      : super.fromBloc(b.AppBloc.fromRepository(repository), key: key);
  App.fromConfig(String name, {Key key})
      : super.fromBloc(b.AppBloc.fromConfig(name), key: key);

  Widget newStateWidget() => MaterialApp(home: super.newStateWidget());

  Widget updatingStateWidget() =>
      MaterialApp(home: super.updatingStateWidget());

  Widget readyStateWidget(d.AppModel app) =>
      BlocProvider.value(value: this.bloc, child: p.AppPage(app.appPage));
}
