import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rishtaaunty/blocs/blocs.dart' as b;
import 'package:rishtaaunty/data/data.dart' as d;
import 'package:rishtaaunty/widgets/widgets.dart' as w;

class App extends StatefulWidget {
  final b.AppBloc appBloc;

  App(this.appBloc, [Key key]) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  d.AppPageRepository _appPageRepository;

  @override
  void initState() {
    super.initState();
    _appPageRepository = d.AppPageRepository.fromRepository(
        repository: widget.appBloc.repository);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: widget.appBloc,
        child: MaterialApp(
            home: w.BlocWidget<b.AppBloc>(
                widget: Scaffold(body: Center(child: Text('New...'))))));
  }
}
