import 'package:flutter/material.dart';
import 'package:rishtaaunty/utils/Menu.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppWidget extends StatefulWidget {
  final String title;
  final Menu menu;
  final FirebaseUser firebaseUser;
  AppWidget({Key key, @required this.title, @required this.menu, @required this.firebaseUser})
      : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> with TickerProviderStateMixin {
  TabController _submenuTabController;
  TabBar _submenuTabBar;
  TabBarView _submenuTabBarView;
  BottomNavigationBar _menuBottomNavigationBar;

  @override
  void dispose() {
    _submenuTabController.dispose();
    super.dispose();
  }

  void _createSubmenuTabController() {
    int _activeSubmenuTabsCount = widget.menu.getActiveSubmenuTabsCount();
    _submenuTabController = TabController(
        vsync: this,
        initialIndex: 0,
        length: _activeSubmenuTabsCount > 0 ? _activeSubmenuTabsCount : 1);
  }

  void _createSubmenuTabBar() {
    int _activeSubmenuTabsCount = widget.menu.getActiveSubmenuTabsCount();
    _submenuTabBar = TabBar(
        controller: _submenuTabController,
        isScrollable: true,
        tabs: _activeSubmenuTabsCount > 0
            ? widget.menu.getActiveSubmenuAsTabList()
            : [Tab(text: "(NULL)")]);
  }

  void _createSubmenuTabBarView() {
    int _activeSubmenuTabsCount = widget.menu.getActiveSubmenuTabsCount();
    _submenuTabBarView = TabBarView(
        controller: _submenuTabController,
        children: _activeSubmenuTabsCount > 0
            ? widget.menu.getActiveSubmenuAsWidgetList()
            : [Center(child: Text("(NULL)"))]);
  }

  void _createMenuBottomNavigationBar() {
    _menuBottomNavigationBar = BottomNavigationBar(
      items: widget.menu.getMenuAsBottomNavigationBarItemList(),
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.menu.activeMenuIndex,
      fixedColor: Theme.of(context).primaryColor,
      onTap: _tapMenuItem,
    );
  }

  void _tapMenuItem(int index) {
    if (!_submenuTabController.indexIsChanging) {
      setState(() {
        _submenuTabController.index = 0;
        widget.menu.activeMenuIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _createSubmenuTabController();
    _createSubmenuTabBar();
    _createSubmenuTabBarView();
    _createMenuBottomNavigationBar();

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
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
              body: _submenuTabBarView,
              bottomNavigationBar: Material(
                  color: Theme.of(context).primaryColor, child: _submenuTabBar),
            )),
        bottomNavigationBar: _menuBottomNavigationBar);
  }
}
