import 'package:flutter/material.dart';
import 'package:rishtaaunty/data/data.dart' as d;
import 'base_bloc.dart';

class AppBloc extends BaseBloc<d.AppModel> {
  final d.AppRepository repository;
  final MenuBloc menuBloc;

  AppBloc.fromConfig(String configName)
      : repository = d.AppRepository(configName),
        menuBloc = MenuBloc() {
    add(BaseEventFetchData<d.AppModel>());
  }

  @override
  Future<d.AppModel?> fetchData() async => repository.getData();

  @override
  void processData(d.AppModel? data) =>
      menuBloc.add(BaseEventProcessData<d.MenuModel>(data?.menu));
}

class AppEventFetchData extends BaseEventFetchData<d.AppModel> {}

class MenuBloc extends BaseBloc<d.MenuModel> {
  final SubmenuBloc submenuBloc;

  MenuBloc() : submenuBloc = SubmenuBloc();

  @override
  void processData(d.MenuModel? data) => submenuBloc.add(
      BaseEventProcessData<d.SubmenuModel>(
          data?.items[data.activeIndex]?.submenu));
}

class SubmenuBloc extends BaseBloc<d.SubmenuModel> {
  List<Tab>? _submenuItems;
  List<Widget>? _submenuViews;

  List<Tab>? get submenuItems => _submenuItems;
  List<Widget>? get submenuViews => _submenuViews;
}
