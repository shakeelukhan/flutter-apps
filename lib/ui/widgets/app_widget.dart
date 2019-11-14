import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rishtaaunty/blocs/blocs.dart' as b;
import 'package:rishtaaunty/data/data.dart' as d;

class AppWidget extends StatefulWidget {
  final d.AppModel data;
  final Widget widget;
  AppWidget(this.data, {this.widget, Key key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> with TickerProviderStateMixin {
  BottomNavigationBar _menuBar;
  TabController _subMenuController;
  TabBar _subMenuBar;
  TabBarView _subMenuBarView;
  int _activeMenuIndex;
  int _activeSubMenuIndex;

  @override
  void initState() {
    super.initState();
    _activeMenuIndex = 0;
  }

  @override
  void dispose() {
    _subMenuController.dispose();
    super.dispose();
  }

  BottomNavigationBar _createMenuBar() {
    return _menuBar = BottomNavigationBar(
      items: widget.data.menuItems.entries
          .map((menuItem) => BottomNavigationBarItem(
              title: Text(menuItem.value.title),
              icon: Icon(IconData(menuItem.value.codePoint,
                  fontFamily: menuItem.value.fontFamily))))
          .toList(),
      currentIndex: _activeMenuIndex,
      type: BottomNavigationBarType.fixed,
      onTap: _tapMenuItem,
    );
  }

  TabController _createSubMenuController() {
    _activeSubMenuIndex = 0;
    return _subMenuController = TabController(
        vsync: this,
        initialIndex: _activeSubMenuIndex,
        length: widget.data.menuItems[_activeMenuIndex].subMenuItems.length);
  }

  TabBar _createSubmenuBar() {
    return _subMenuBar = TabBar(
        controller: _subMenuController,
        isScrollable: true,
        tabs: widget.data.menuItems[_activeMenuIndex].subMenuItems.values
            .map((subMenuItem) => Tab(text: subMenuItem.title))
            .toList());
  }

  TabBarView _createSubmenuView() {
    return _subMenuBarView = TabBarView(
        controller: _subMenuController,
        children: widget.data.menuItems[_activeMenuIndex].subMenuItems.values
            .map((subMenuItem) =>
                Center(child: Text("$_activeMenuIndex: ${subMenuItem.title}")))
            .toList());
  }

  void _tapMenuItem(int index) {
    if (!_subMenuController.indexIsChanging) {
      setState(() {
        print('GOT HERE $index');
        _activeMenuIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _menuBar = _createMenuBar();
    _createSubMenuController();
    _createSubmenuBar();
    _createSubmenuView();

    debugPaintSizeEnabled = widget.data.debugPaintSizeEnabled;
    debugPaintPointersEnabled = widget.data.debugPaintPointersEnabled;

    return MaterialApp(
      debugShowCheckedModeBanner: widget.data.debugShowCheckedModeBanner,
      showPerformanceOverlay: widget.data.showPerformanceOverlay,
      showSemanticsDebugger: widget.data.showSemanticsDebugger,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.data.title),
          centerTitle: true,
        ),
        body: Container(
            alignment: Alignment.center,
            child: Scaffold(
              body: _subMenuBarView,
              bottomNavigationBar:
                  Material(color: Colors.orange, child: _subMenuBar),
            )),
        //   body: widget.widget ?? Center(child: Text('NULL')),
        bottomNavigationBar: _menuBar,
      ),
    );
  }
}
