import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rishtaaunty/data/data.dart' as d;
import 'base_bloc.dart';

class AppBloc extends BaseBloc<d.AppModel> {
  final d.AppRepository repository;
  final MenuBloc menuBloc;

  AppBloc.fromConfig(String configName)
      : this.repository = d.AppRepository(configName),
        menuBloc = MenuBloc() {
    this.dispatch(BaseEventFetchData<d.AppModel>());
  }

  @override
  Future<d.AppModel> fetchData() async => repository?.getData();

  @override
  void processData(d.AppModel _data) =>
      menuBloc?.dispatch(BaseEventProcessData<d.MenuModel>(_data?.menu));
}

class AppEventFetchData extends BaseEventFetchData<d.AppModel> {}

class MenuBloc extends BaseBloc<d.MenuModel> {
  final SubmenuBloc submenuBloc;

  MenuBloc() : submenuBloc = SubmenuBloc();

  @override
  void processData(d.MenuModel _data) =>
      submenuBloc?.dispatch(BaseEventProcessData<d.SubmenuModel>(
          _data?.items[_data?.activeIndex ?? 0]?.submenu));
}

class SubmenuBloc extends BaseBloc<d.SubmenuModel> {
  List<Tab> _submenuItems;
  List<Widget> _submenuViews;

  List<Tab> get submenuItems => _submenuItems;
  List<Widget> get submenuViews => _submenuViews;
/*
  SubmenuBloc() {
    _submenuItems = data?.items?.values == null
        ? null
        : data.items.values
            .map((submenuItem) => Tab(text: submenuItem.title))
            .toList();
    _submenuViews = data.items.values
        .map((submenuItem) => Center(child: Text("${data.toString()}")))
        .toList();
  }*/
}
