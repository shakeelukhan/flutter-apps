import 'package:flutter/material.dart';

import 'package:thebettingapp/screens/settings/game_screen.dart';
import 'package:thebettingapp/screens/settings/session_screen.dart';
import 'package:thebettingapp/screens/settings/all_screen.dart';
import 'package:thebettingapp/screens/session/martingdale_screen.dart';
import 'package:thebettingapp/screens/session/martingdale_screen2.dart';
import 'package:thebettingapp/screens/session/simulation_screen.dart';
import 'package:thebettingapp/screens/game/cointoss_screen.dart';
import 'package:thebettingapp/utils/NavHelper.dart';

class App extends StatelessWidget {
  // App title
  static String appTitle = 'TheBettingApp';

  // App theme
  static ThemeData _appThemeData() => ThemeData(
    primarySwatch: Colors.blue,
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
  _AppStateful({super.key, this.title});
  final String? title;

  @override
  _AppStatefulState createState() => _AppStatefulState();
}

class _AppStatefulState extends State<_AppStateful>
    with TickerProviderStateMixin {
  late NavHelper _appNavHelper;
  late AppBar _appBar;
  late TabController _submenuTabController; // TabController for submenu
  late TabBar _submenuTabBar; // TabBar for submenu
  late TabBarView _submenuTabBarView; // TabBarView for submenu
  late BottomNavigationBar
      _menuBottomNavigationBar; // BottomNavigationBar for menu

  @override
  void initState() {
    super.initState();

    // Build app navigation
    _appNavHelper = NavHelper();
    _appNavHelper.addMenuItem("Settings", Icons.settings);
    _appNavHelper.addSubmenuItem("Settings", "Session", SessionScreen());
    _appNavHelper.addSubmenuItem("Settings", "Game", GameScreen());
    _appNavHelper.addSubmenuItem("Settings", "All", AllScreen());
    _appNavHelper.addMenuItem("Session", Icons.local_atm);
    _appNavHelper.addSubmenuItem("Session", "Simulation", SimulationScreen());
    _appNavHelper.addSubmenuItem("Session", "Martingdale", MartingdaleScreen());
    _appNavHelper.addSubmenuItem("Session", "Martingdale2", MartingdaleScreen2());
    _appNavHelper.addMenuItem("Game", Icons.casino);
    _appNavHelper.addSubmenuItem("Game", "Coin Toss", CoinTossScreen());
    _appNavHelper.addSubmenuItem("Game", "Simulate", Center(child: Text("Simulate: ")));
    _appNavHelper.activeMenuIndex = 1;

    // Create then save AppBar
    _appBar = AppBar(
      title: Text(App.appTitle),
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
      selectedItemColor: Theme.of(context).primaryColor,
      onTap: _tapMenuItem,
    );
  }

  void _tapMenuItem(int index) {
    _submenuTabController.index = 0;
    if (!_submenuTabController.indexIsChanging) {
      setState(() {
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
