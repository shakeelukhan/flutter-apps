import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rishtaaunty/blocs/blocs.dart' as b;
import 'package:rishtaaunty/models/models.dart' as m;
import 'package:rishtaaunty/utils/utils.dart' as u;
import 'package:rishtaaunty/old_files/widgets/HomeWidget.dart';

b.BaseBloc bMenu;
List<m.MenuWidgetModel> menuList;
List<BottomNavigationBarItem> _menuNavigation;
List<BottomNavigationBarItem> get menuNavigation => _menuNavigation;
Router router = Router();

Future<List<BottomNavigationBarItem>> getMenu() async {
//  Map assetMap = await u.asset.getJson(r.defaultAssetKey);
//x  Map dataMap = assetMap['menu'];
  // menuList = u.SerializerUtils.deserializeJsonWith<List<m.MenuWidgetModel>>(dataMap['list']);

//  BuiltList<T> deserializeListOf<T>(dynamic value) =>
  //    BuiltList.from(value.map((value) => deserialize<T>(value)).toList(growable: false));
  print(menuList);
  print('a');
  // print((await rMenu.data)["list"]);
  print('b');
  // bMenu = await b.WidgetBloc<m.MenuWidgetModel>(repository: rMenu);
  // print(await rMenu.data);

  _menuNavigation = menuList
      .map((menuTab) => BottomNavigationBarItem(
          title: Text(menuTab.title),
          icon: Icon(
              IconData(menuTab.codePoint, fontFamily: menuTab.fontFamily))))
      .toList();
}

class AppPage2 extends StatefulWidget {
  AppPage2({Key key, @required this.data}) : super(key: key);

  final m.AppWidgetModel data;

  @override
  _AppPage2State createState() {
    return _AppPage2State();
  }
}

class _AppPage2State extends State<AppPage2> {
  @override
  void initState() {
    super.initState();
    router = Router();
    AppRoutes.configureRoutes(router);
    //  getMenu();
  }

  @override
  void dispose() {
    bMenu.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = widget.data.debugPaintSizeEnabled;
    debugPaintPointersEnabled = widget.data.debugPaintPointersEnabled;
    return MaterialApp(
      title: widget.data.title,
      debugShowCheckedModeBanner: widget.data.debugShowCheckedModeBanner,
      showPerformanceOverlay: widget.data.showPerformanceOverlay,
      showSemanticsDebugger: widget.data.showSemanticsDebugger,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.data.title),
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
          child: Scaffold(body: Text('abc')),
        ),
        /*   bottomNavigationBar: BottomNavigationBar(
              items: null,
              currentIndex: 0,
              type: BottomNavigationBarType.fixed,
              fixedColor: Theme.of(context).primaryColor,
              onTap: (int i) {
                setState(() {});
              })*/
      ),
      onGenerateRoute: router.generator,
    );
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
