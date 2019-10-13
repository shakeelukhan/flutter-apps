import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rishtaaunty/blocs/app_bloc.dart';
import 'package:rishtaaunty/pages/login.dart';

class AppPage extends StatefulWidget {
  final remoteConfigKey, jsonKey;
  AppPage({Key key, @required this.remoteConfigKey, @required this.jsonKey})
      : super(key: key);

  _AppPageState get appPageState => this.appPageState;

  @override
  _AppPageState createState() {
    return _AppPageState();
  }
}

class _AppPageState extends State<AppPage> {
  AppBloc appBloc;

  @override
  void initState() {
    super.initState();
    appBloc = AppBloc(
        remoteConfigKey: widget.remoteConfigKey, jsonKey: widget.jsonKey);
    appBloc.dispatch(AppEventUpdate());
  }

  @override
  void dispose() {
    appBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
        bloc: appBloc,
        builder: (context, state) {
          if (state is AppStateNew || state is AppStateUpdating) {
            return Center(child: CircularProgressIndicator());
          }
          debugPaintSizeEnabled = appBloc.appData.debugPaintSizeEnabled;
          debugPaintPointersEnabled = appBloc.appData.debugPaintPointersEnabled;
          return MaterialApp(
              title: appBloc.appData.title,
              debugShowCheckedModeBanner:
                  appBloc.appData.debugShowCheckedModeBanner,
              showPerformanceOverlay: appBloc.appData.showPerformanceOverlay,
              showSemanticsDebugger: appBloc.appData.showSemanticsDebugger,
              theme: ThemeData(primarySwatch: Colors.orange),
//onGenerateRoute: AppConfig.router.generator,
              home: LoginPage(appBloc: appBloc));
        });
  }
}
