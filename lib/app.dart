import 'package:flutter/material.dart';

import 'package:thepakistaniapp/screens/home/auth_screen.dart';
import 'package:thepakistaniapp/screens/home/counter_screen.dart';
import 'package:thepakistaniapp/screens/home/firebase_screen.dart';
import 'package:thepakistaniapp/screens/home/temp_screen.dart';
import 'package:thepakistaniapp/screens/news_screen.dart';
import 'package:thepakistaniapp/screens/events/events_summary_screen.dart';
import 'package:thepakistaniapp/screens/home/waiting_screen.dart';
import 'package:thepakistaniapp/screens/events/events_map_screen.dart';
import 'package:thepakistaniapp/utils/NavHelper.dart';

class App extends StatelessWidget {
  // App title
  static String appTitle = 'ThePakistaniApp';

  // App theme
  static ThemeData _appThemeData() => ThemeData(
        primarySwatch: Colors.green,
      );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: _appThemeData(),
      home: _AppStateful(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _AppStateful extends StatefulWidget {
  _AppStateful({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AppStatefulState createState() => _AppStatefulState();
}

class _AppStatefulState extends State<_AppStateful>
    with TickerProviderStateMixin {
  NavHelper _appNavHelper;
  AppBar _appBar;
  TabController _submenuTabController; // TabController for submenu
  TabBar _submenuTabBar; // TabBar for submenu
  TabBarView _submenuTabBarView; // TabBarView for submenu
  BottomNavigationBar _menuBottomNavigationBar; // BottomNavigationBar for menu

  @override
  void initState() {
    super.initState();

    // Build app navigation
    _appNavHelper = new NavHelper();
    _appNavHelper.addMenuItem("Home", Icons.home);
    _appNavHelper.addSubmenuItem("Home", "Main", HomeScreen());
    _appNavHelper.addSubmenuItem("Home", "Auth", AuthScreen());
    _appNavHelper.addSubmenuItem("Home", "Counter", CounterScreen());
    _appNavHelper.addSubmenuItem("Home", "Firebase", FirebaseScreen());
    _appNavHelper.addSubmenuItem("Home", "Waiting", WaitingScreen());
    _appNavHelper.addMenuItem("Events", Icons.event);
    _appNavHelper.addSubmenuItem("Events", "Summary", EventsSummaryScreen());
    _appNavHelper.addSubmenuItem("Events", "Map", EventsMapScreen());
    _appNavHelper.addMenuItem("News", Icons.web);
    _appNavHelper.addSubmenuItem("News", "Main", NewsScreen());
    _appNavHelper.addSubmenuItem("News", "News2", Center(child: Text("News2")));
    _appNavHelper.addMenuItem("Dramas", Icons.live_tv);
    _appNavHelper.addSubmenuItem("Dramas", "Dramas1", Center(child: Text("Dramas1")));
    _appNavHelper.addSubmenuItem("Dramas", "Dramas2", Center(child: Text("Dramas2")));
    _appNavHelper.addMenuItem("Recipes", Icons.fastfood);
    _appNavHelper.addSubmenuItem("Recipes", "Recipes1", Center(child: Text("Recipes1")));
    _appNavHelper.addSubmenuItem("Recipes", "Recipes2", Center(child: Text("Recipes2")));
    _appNavHelper.addMenuItem("About", Icons.info);
    _appNavHelper.addSubmenuItem("About", "About1", Center(child: Text("About1")));
    _appNavHelper.addSubmenuItem("About", "About2", Center(child: Text("About2")));
    _appNavHelper.activeMenuIndex = 0;

    // Create then save AppBar
    _appBar = AppBar(
      title: Text(App.appTitle),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Icon(Icons.account_circle),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Icon(Icons.more_vert),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _submenuTabController.dispose();
    super.dispose();
  }

  // Create then save submenu TabController
  void _updateSubmenuTabController() {
    int _activeSubmenuItemsCount = _appNavHelper.getActiveSubmenuItemsCount();
    _submenuTabController = TabController(
        vsync: this,
        initialIndex: 0,
        length: _activeSubmenuItemsCount > 0 ? _activeSubmenuItemsCount : 1);
  }

  // Create then save submenu TabBar
  void _updateSubmenuTabBar() {
    int _activeSubmenuItemsCount = _appNavHelper.getActiveSubmenuItemsCount();
    _submenuTabBar = TabBar(
        controller: _submenuTabController,
        isScrollable: true,
        tabs: _activeSubmenuItemsCount > 0
            ? _appNavHelper.getActiveSubmenuAsTabList()
            : [Tab(text: "(NULL)")]);
  }

  // Create then save submenu TabBarView
  void _updateSubmenuTabBarView() {
    int _activeSubmenuItemsCount = _appNavHelper.getActiveSubmenuItemsCount();
    _submenuTabBarView = TabBarView(
        controller: _submenuTabController,
        children: _activeSubmenuItemsCount > 0
            ? _appNavHelper.getActiveSubmenuAsWidgetList()
            : [Center(child: Text("(NULL)"))]);
  }

  // Create then save menu BottomNavigationBar
  void _updateMenuBottomNavigationBar() {
    _menuBottomNavigationBar = BottomNavigationBar(
      items: _appNavHelper.getMenuAsBottomNavigationBarItemList(),
      type: BottomNavigationBarType.fixed,
      currentIndex: _appNavHelper.activeMenuIndex,
      fixedColor: Theme.of(context).primaryColor,
      onTap: _tapMenuItem,
    );
  }

  void _tapMenuItem(int index) {
    if (!_submenuTabController.indexIsChanging) {
      setState(() {
        _submenuTabController.index = 0;
        _appNavHelper.activeMenuIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _updateSubmenuTabController();
    _updateSubmenuTabBar();
    _updateSubmenuTabBarView();
    _updateMenuBottomNavigationBar();

    return Scaffold(
        appBar: _appBar,
        body: Container(
            alignment: Alignment.center,
            child: Scaffold(
              body: _submenuTabBarView,
              bottomNavigationBar: Material(
                  color: Theme.of(context).primaryColor, child: _submenuTabBar),
            )),
        bottomNavigationBar: _menuBottomNavigationBar);
  }
}
