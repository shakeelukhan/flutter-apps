import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rishtaaunty/blocs/app/app_bloc.dart';
import 'package:rishtaaunty/models/app_model2.dart';
import 'package:rishtaaunty/models/menu_model.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc({@required this.appBloc}) {
    dispatch(MenuEventStartup());
  }

  AppBloc appBloc;
  List<BottomNavigationBarItem> _menuNavigation;
  List<BottomNavigationBarItem> get menuNavigation => _menuNavigation;

  @override
  MenuState get initialState => MenuStateNew();

  @override
  Stream<MenuState> mapEventToState(MenuEvent event) async* {
    print('MENU_START: EVENT=${event} STATE=${currentState}');
    if (event is MenuEventStartup) {
      yield MenuStateNew();
    }
    if (event is MenuEventUpdate) {
      yield MenuStateUpdating();
      try {
        _menuNavigation = getMenu();
        yield MenuStateUpdated();
      } on Exception catch (error) {
        yield MenuStateError(error);
        print('EXCEPTION: $error');
      }
    }
    print('MENU_END: EVENT=${event} STATE=${currentState}');
  }

  List<BottomNavigationBarItem> getMenu() =>
      _menuNavigation = appBloc.appData.menuList
          .map((menuTab) => BottomNavigationBarItem(
              title: Text(menuTab.title),
              icon: Icon(
                  IconData(menuTab.codePoint, fontFamily: menuTab.fontFamily))))
          .toList();
}
