import 'package:built_collection/built_collection.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rishtaaunty/blocs/blocs.dart' as b;
import 'package:rishtaaunty/data/data.dart' as d;
import 'package:rishtaaunty/old_files/widgets/HomeWidget.dart';
import '../widgets/bloc_widget.dart';

class AppPage extends BlocWidget<d.AppModel> {
  AppPage.fromBloc(b.AppBloc bloc, {Key key}) : super.fromBloc(bloc, key: key);
  AppPage.fromConfig(String name, {Key key})
      : super.fromBloc(b.AppBloc.fromConfig(name), key: key);

  @override
  Widget readyStateWidget(d.AppModel data) => null;

  @override
  _AppState createState() => _AppState();
}

class _AppState extends BlocWidgetState<d.AppModel> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<BottomNavigationBarItem> getMenuList(
          BuiltList<d.MenuItemModel> menuList) =>
      menuList
          .map((menuTab) => BottomNavigationBarItem(
              title: Text(menuTab.title),
              icon: Icon(
                  IconData(menuTab.codePoint, fontFamily: menuTab.fontFamily))))
          .toList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<b.AppBloc, b.BaseState<d.AppModel>>(
        bloc: bloc,
        condition: (previousState, state) => previousState != state,
        builder: (context, state) {
          Widget _widget;

          if (state is b.BaseStateNew<d.AppModel>) {
            _widget =
                MaterialApp(home: Center(child: CircularProgressIndicator()));
          }

          if (state is b.BaseStateUpdating<d.AppModel>) {
            _widget = MaterialApp(home: Center(child: Text('Updating...')));
          }

          if (state is b.BaseStateReady<d.AppModel>) {
            debugPaintSizeEnabled = state.data.debugPaintSizeEnabled;
            debugPaintPointersEnabled = state.data.debugPaintPointersEnabled;

            _widget = BlocProvider.value(
                value: bloc,
                child: MaterialApp(
                    debugShowCheckedModeBanner:
                        state.data.debugShowCheckedModeBanner,
                    showPerformanceOverlay: state.data.showPerformanceOverlay,
                    showSemanticsDebugger: state.data.showSemanticsDebugger,
                    theme: ThemeData(primarySwatch: Colors.orange),
                    home: Scaffold(
                      appBar: AppBar(
                        title: Text(state.data.title),
                        centerTitle: true,
                        actions: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Icon(Icons.more_vert),
                          ),
                        ],
                      ),
                      body: Container(
                        alignment: Alignment.center,
                        child: Scaffold(
                          body: Text('abc'),
                          bottomNavigationBar: BottomNavigationBar(
                            items: getMenuList(state.data.menu),
                            currentIndex: _selectedIndex,
                            //selectedItemColor: Colors.amber[800],
                            type: BottomNavigationBarType.fixed,
                            fixedColor: Theme.of(context).primaryColor,
                            onTap: _onItemTapped,
                          ),
                        ),
                      ),
                    )));
          }
          return _widget;
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
  // return AppScreen(title: 'dummy');
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
