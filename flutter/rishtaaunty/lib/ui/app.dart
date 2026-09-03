import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:rishtaaunty/blocs/blocs.dart' as b;
import 'package:rishtaaunty/data/data.dart' as d;
import 'pages/home_page.dart';
import 'widgets/app_widget.dart';
import 'widgets/bloc_widget.dart';
import 'widgets/dialog_widget.dart';
import 'routes.dart';

class App extends StatefulWidget {
  final b.AppBloc _bloc;

  App.fromBloc(this._bloc, {Key key}) : super(key: key);
  App.fromConfig(String name, {Key key})
      : this._bloc = b.AppBloc.fromConfig(name),
        super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with TickerProviderStateMixin {
  b.AppBloc _bloc;
  d.AppModel _app;
  bool _buildMenu;
  d.MenuModel _menu;
  List<BottomNavigationBarItem> _menuItems;
  d.SubmenuModel _submenu;

  @override
  void initState() {
    super.initState();
    _bloc = widget._bloc ?? BlocProvider.of<b.AppBloc>(context);
    _app = d.AppModel();
    _buildMenu = true;
    _getMenuItems();
    Routes.configureRoutes(router);
  }

  @override
  void dispose() {
    _bloc.menuBloc?.submenuBloc?.dispose();
    _bloc.menuBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<b.AppBloc, b.BaseState<d.AppModel>>(
        bloc: _bloc,
        condition: (previousState, state) =>
            previousState != state && state is b.BaseStateReady<d.AppModel>,
        builder: (context, state) {
          if (state is b.BaseStateReady<d.AppModel>) _app = state.data;

          debugPaintSizeEnabled = _app.debugPaintSizeEnabled;
          debugPaintPointersEnabled = _app.debugPaintPointersEnabled;

          return MaterialApp(
            debugShowCheckedModeBanner: _app.debugShowCheckedModeBanner,
            showPerformanceOverlay: _app.showPerformanceOverlay,
            showSemanticsDebugger: _app.showSemanticsDebugger,
            theme: ThemeData(primarySwatch: Colors.orange),
            // initialRoute: Home.PATH,
            // onGenerateRoute: router.generator,
            home: Scaffold(
                appBar: AppBar(
                  title: Text(_app.title),
                  centerTitle: true,
                ),
                /*body: BlocBuilder<b.SubmenuBloc, b.BaseState<d.SubmenuModel>>(
                    bloc: _submenuBloc,
                    condition: (previousState, state) =>
                        state is b.BaseStateReady<d.SubmenuModel> &&
                        previousState != state,
                    builder: (context, state) {
                      _submenuBloc = b.SubmenuBloc.fromData(
                          _menuBloc
                              .data?.items[_menuBloc.data?.activeIndex].submenu,
                          this);
                      TabController _tabController =
                          _submenuBloc.getSubmenuController();
                      return _tabController == null
                          ? DialogWidget(
                              progress: true,
                              text: state.runtimeType.toString())
                          : Scaffold(
                              body: _submenuBloc.getSubmenuView(),
                              bottomNavigationBar: Material(
                                  color: Theme.of(context).primaryColor,
                                  child: _submenuBloc.getSubmenuBar()),
                            );
                    }), */
                body: BlocBuilder<b.SubmenuBloc, b.BaseState<d.SubmenuModel>>(
                    bloc: _bloc?.menuBloc?.submenuBloc,
                    condition: (previousState, state) =>
                        previousState != state &&
                        state is b.BaseStateReady<d.SubmenuModel>,
                    builder: (context, state) {
                      return DialogWidget(
                          progress: true, text: state.runtimeType.toString());
                    }),
                bottomNavigationBar:
                    BlocBuilder<b.MenuBloc, b.BaseState<d.MenuModel>>(
                        bloc: _bloc?.menuBloc,
                        condition: (previousState, state) {
                          bool condition;
                          if (previousState != state &&
                              state is b.BaseStateReady<d.MenuModel>) {
                            condition = true;
                            if (previousState
                                    is b.BaseStateReady<d.MenuModel> &&
                                state?.data?.items !=
                                    previousState?.data?.items) {
                              _buildMenu = true;
                            } else {
                              _buildMenu = false;
                            }
                          }
                          return condition;
                        },
                        builder: (context, state) {
                          if (state is b.BaseStateReady<d.MenuModel> &&
                              state?.data?.items != _menu?.items) {
                            _menu = state?.data;
                            _menuItems = _getMenuItems();
                          }

                          return _getMenuBar();
                        })),
          );
        });
  }

  List<BottomNavigationBarItem> _getMenuItems() {
    _menuItems = _menu?.items?.isNotEmpty == true
        ? _menu.items.entries
            .map((menuItem) => BottomNavigationBarItem(
                title: Text(menuItem.value?.title ?? ''),
                icon: Icon(IconData(menuItem.value?.codePoint ?? 0,
                    fontFamily:
                        menuItem.value?.fontFamily ?? 'MaterialIcons'))))
            .toList()
        : [];
    while (_menuItems.length < 2) {
      _menuItems
          .add(BottomNavigationBarItem(title: Container(), icon: Container()));
    }
/*    _menuItems?.fillRange(_menuItems?.length ?? 0, 2,
        BottomNavigationBarItem(title: Container(), icon: Container())); */
    return _menuItems;
  }

  BottomNavigationBar _getMenuBar() {
    print(_menu.activeIndex);
    return BottomNavigationBar(
        items: _menuItems,
        currentIndex: _menu?.activeIndex ?? 0,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) => _bloc?.menuBloc?.dispatch(
            b.BaseEventProcessData<d.MenuModel>(
                _menu?.rebuild((b) => b.activeIndex = index))));
  }

  TabController _getSubmenuController(d.SubmenuModel _data) =>
      _data?.items?.isNotEmpty == true
          ? TabController(
              vsync: this,
              initialIndex: _data.activeIndex,
              length: _data.items.length)
          : null;
/*
  TabBar _getSubmenuBar(TabController _submenuController) => _submenuBloc?.data?.items?.isNotEmpty == true
      ? TabBar(
    controller: _submenuController,
    isScrollable: true,
    tabs: submenuItems,
  )
      : null;

  TabBarView _getSubmenuView(TabController _submenuController) => _submenuBloc?.data?.items?.isNotEmpty == true
      ? TabBarView(
      controller: _submenuController,
      children: _submenuBloc?.data?.itemsdata?.items?.isNotEmpty == true ? [] : _submenuViews)
      : null; */
}
