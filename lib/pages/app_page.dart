import 'dart:convert';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rishtaaunty/blocs/app/app_bloc.dart';
import 'package:rishtaaunty/old_files/AppScreen.dart';
import 'package:rishtaaunty/old_files/widgets/HomeWidget.dart';
import 'package:rishtaaunty/utils/test.dart';
import 'package:flutter/foundation.dart';

int index2 = 0;

class AppPage extends StatefulWidget with Test {
  AppPage({Key key, @required this.appBloc}) : super(key: key);

  final AppBloc appBloc;
  _AppPageState get appPageState => this.appPageState;

  @override
  _AppPageState createState() {
    return _AppPageState();
  }
}

class _AppPageState extends State<AppPage> {
  @override
  void initState() {
    super.initState();
    widget.appBloc.router = new Router();
    AppRoutes.configureRoutes(widget.appBloc.router);
  }

  @override
  void dispose() {
    widget.appBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
        bloc: widget.appBloc,
        builder: (context, state) {
          if (state is AppStateNew || state is AppStateUpdating) {
            return Center(child: CircularProgressIndicator());
          }
          debugPaintSizeEnabled = widget.appBloc.appData.debugPaintSizeEnabled;
          debugPaintPointersEnabled =
              widget.appBloc.appData.debugPaintPointersEnabled;

          List<BottomNavigationBarItem> items2 = <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: const Icon(Icons.home), title: Text("Home")),
            BottomNavigationBarItem(
                icon: const Icon(Icons.account_circle), title: Text("Profile")),
            BottomNavigationBarItem(
                icon: const Icon(Icons.search), title: Text("Search")),
            BottomNavigationBarItem(
                icon: const Icon(Icons.favorite), title: Text("Rishtas")),
            BottomNavigationBarItem(
                icon: const Icon(Icons.info), title: Text("About"))
          ];
//print(jsonEncode(items2[0].toString()));
          return MaterialApp(
            title: widget.appBloc.appData.title,
            debugShowCheckedModeBanner:
                widget.appBloc.appData.debugShowCheckedModeBanner,
            showPerformanceOverlay:
                widget.appBloc.appData.showPerformanceOverlay,
            showSemanticsDebugger: widget.appBloc.appData.showSemanticsDebugger,
            theme: ThemeData(primarySwatch: Colors.orange),
            home: Scaffold(
              appBar: AppBar(
                title: Text(widget.appBloc.appData.title),
                centerTitle: true,
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Icon(Icons.more_vert),
                  ),
                ],
              ),
              body: Home2(),
              bottomNavigationBar: BottomNavigationBar(
                items: items2,
                currentIndex: index2,
                type: BottomNavigationBarType.fixed,
                fixedColor: Theme.of(context).primaryColor,
                onTap: (int i) {
                  setState(() {
                    widget.appBloc.dispatch(AppEventStartup());
                    index2 = i;
                  });
                },
              ),
            ),
            onGenerateRoute: widget.appBloc.router.generator,
          );
        });
  }
}

var homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  //   print('PARAMS = ${params["id"][0]}');
  return Home();
});

var homeHandler2 = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  //   print('PARAMS = ${params["id"][0]}');
  return Home2();
});

var appHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return AppScreen();
});

class AppRoutes {
  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('ROUTE WAS NOT FOUND !!!');
      print('${params.toString()}');
    });
    //   router.define(AppScreen.PATH, handler: appHandler);
    //  router.define(Home.PATH, handler: homeHandler);
    // router.define(Home2.PATH, handler: homeHandler2);
    //router.define('/', handler: appHandler);
  }
}
