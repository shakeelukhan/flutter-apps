import 'package:flutter/material.dart';

class _MenuTab {
  String title;
  IconData icon;
  _MenuTab(this.title, this.icon);
}

class _SubmenuTab {
  String title;
  Widget widget;
  _SubmenuTab(this.title, this.widget);
}

class Menu {
  List<_MenuTab> _menuTabs;
  Map<String, List<_SubmenuTab>> _submenuTabs;
  int activeMenuIndex;

  Menu() {
    _menuTabs = List<_MenuTab>();
    _submenuTabs = Map<String, List<_SubmenuTab>>();
    activeMenuIndex = 0;
  }

  void addMenuTab(String title, IconData icon) {
    _menuTabs.add(_MenuTab(title, icon));
    _submenuTabs[title] = List<_SubmenuTab>();
  }

  void addSubmenuTab(String parent, String title, Widget widget) =>
      _submenuTabs[parent].add(_SubmenuTab(title, widget));

  String getActiveMenuTitle() => _menuTabs.elementAt(activeMenuIndex).title;

  List<_SubmenuTab> getActiveSubmenuTabs() =>
      _submenuTabs[getActiveMenuTitle()].toList();

  int getActiveSubmenuTabsCount() => getActiveSubmenuTabs().length;

  List<Tab> getActiveSubmenuAsTabList() =>
      getActiveSubmenuTabs().map((tab) => Tab(text: tab.title)).toList();

  List<Widget> getActiveSubmenuAsWidgetList() =>
      getActiveSubmenuTabs().map((tab) => tab.widget).toList();

  List<BottomNavigationBarItem> getMenuAsBottomNavigationBarItemList() =>
      _menuTabs
          .map((tab) => BottomNavigationBarItem(
              title: Text(tab.title), icon: Icon(tab.icon)))
          .toList();
}
