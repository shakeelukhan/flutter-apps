import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rishta_aunty/blocs/blocs.dart' as b;
import 'package:rishta_aunty/data/data.dart' as d;
import 'widgets/dialog_widget.dart';
import 'routes.dart';

class App extends StatefulWidget {
  final b.AppBloc? bloc;

  const App.fromBloc(this.bloc, {super.key});
  App.fromConfig(String name, {super.key}) : bloc = b.AppBloc.fromConfig(name);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with TickerProviderStateMixin {
  late b.AppBloc _bloc;
  d.AppModel _app = d.AppModel();
  d.MenuModel? _menu;
  List<BottomNavigationBarItem> _menuItems = [];

  @override
  void initState() {
    super.initState();
    _bloc = widget.bloc ?? BlocProvider.of<b.AppBloc>(context);
    Routes.configureRoutes(router);
  }

  @override
  void dispose() {
    _bloc.menuBloc.submenuBloc.close();
    _bloc.menuBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<b.AppBloc, b.BaseState<d.AppModel>>(
        bloc: _bloc,
        buildWhen: (previousState, state) =>
            previousState != state && state is b.BaseStateReady<d.AppModel>,
        builder: (context, state) {
          if (state is b.BaseStateReady<d.AppModel> && state.data != null) {
            _app = state.data!;
          }

          debugPaintSizeEnabled = _app.debugPaintSizeEnabled;
          debugPaintPointersEnabled = _app.debugPaintPointersEnabled;

          return MaterialApp(
            debugShowCheckedModeBanner: _app.debugShowCheckedModeBanner,
            showPerformanceOverlay: _app.showPerformanceOverlay,
            showSemanticsDebugger: _app.showSemanticsDebugger,
            theme: ThemeData(primarySwatch: Colors.orange),
            home: Scaffold(
                appBar: AppBar(
                  title: Text(_app.title),
                  centerTitle: true,
                ),
                body: BlocBuilder<b.SubmenuBloc, b.BaseState<d.SubmenuModel>>(
                    bloc: _bloc.menuBloc.submenuBloc,
                    buildWhen: (previousState, state) =>
                        previousState != state &&
                        state is b.BaseStateReady<d.SubmenuModel>,
                    builder: (context, state) {
                      return DialogWidget(
                          progress: true, text: state.runtimeType.toString());
                    }),
                bottomNavigationBar:
                    BlocBuilder<b.MenuBloc, b.BaseState<d.MenuModel>>(
                        bloc: _bloc.menuBloc,
                        buildWhen: (previousState, state) {
                          return previousState != state &&
                              state is b.BaseStateReady<d.MenuModel>;
                        },
                        builder: (context, state) {
                          if (state is b.BaseStateReady<d.MenuModel> &&
                              state.data?.items != _menu?.items) {
                            _menu = state.data;
                            _menuItems = _getMenuItems();
                          }

                          return _getMenuBar();
                        })),
          );
        });
  }

  List<BottomNavigationBarItem> _getMenuItems() {
    final items = _menu?.items;
    List<BottomNavigationBarItem> menuItems = items != null && items.isNotEmpty
        ? items.entries
            .map((menuItem) => BottomNavigationBarItem(
                label: menuItem.value.title,
                icon: Icon(IconData(menuItem.value.codePoint,
                    fontFamily: menuItem.value.fontFamily))))
            .toList()
        : [];
    while (menuItems.length < 2) {
      menuItems.add(
          const BottomNavigationBarItem(label: '', icon: SizedBox.shrink()));
    }
    return menuItems;
  }

  BottomNavigationBar _getMenuBar() {
    return BottomNavigationBar(
        items: _menuItems,
        currentIndex: _menu?.activeIndex ?? 0,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) => _bloc.menuBloc.add(
            b.BaseEventProcessData<d.MenuModel>(
                _menu?.rebuild((b) => b.activeIndex = index))));
  }
}
