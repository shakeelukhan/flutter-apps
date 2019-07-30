import 'package:flutter/material.dart';

// Class for menu item
class _MenuItem {
  String title;
  IconData icon;

  _MenuItem(this.title, this.icon);
}

// Class for submenu item
class _SubmenuItem {
  String title;
  Widget widget;

  _SubmenuItem(this.title, this.widget);
}

class NavHelper {
  List<_MenuItem> _menuItems; // List of menu items
  Map<String, List<_SubmenuItem>> _submenuItemsMap; // Map of submenu items
  int activeMenuIndex; // Active menu index

  // Constructor
  NavHelper() {
    _menuItems = List<_MenuItem>();
    _submenuItemsMap = Map<String, List<_SubmenuItem>>();
  }

  // Add a menu item
  void addMenuItem(String title, IconData icon) {
    _menuItems.add(_MenuItem(title, icon));
    _submenuItemsMap[title] = List<_SubmenuItem>();
  }

  // Add a submenu item
  void addSubmenuItem(String parent, String title, Widget widget) =>
      _submenuItemsMap[parent].add(_SubmenuItem(title, widget));

  // Get active menu title
  String _getActiveMenuTitle() => _menuItems.elementAt(activeMenuIndex).title;

  // Get submenu list for active menu
  List<_SubmenuItem> _getActiveSubmenuItems() =>
      _submenuItemsMap[_getActiveMenuTitle()].toList();

  // Get count of submenu list for active menu
  int getActiveSubmenuItemsCount() => _getActiveSubmenuItems().length;

  // Get active submenu as List<Tab>
  List<Tab> getActiveSubmenuAsTabList() => _getActiveSubmenuItems()
      .map((item) => Tab(text: item.title.toUpperCase()))
      .toList();

  // Get active submenu as List<Widget>
  List<Widget> getActiveSubmenuAsWidgetList() =>
      _getActiveSubmenuItems().map((item) => item.widget).toList();

  // Get menu as BottomNavigationBar list
  List<BottomNavigationBarItem>
  getMenuAsBottomNavigationBarItemList() => _menuItems
      .map((item) => BottomNavigationBarItem(
      title: Text(item.title), icon: Icon(item.icon)))
      .toList();
}
