import 'dart:async';
import 'package:bloc/bloc.dart';
import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rishtaaunty/blocs/widget_bloc.dart';
import 'package:rishtaaunty/blocs/menu/menu_bloc.dart';
import 'package:rishtaaunty/models/app_model2.dart';
import 'package:rishtaaunty/models/widget_model.dart';
import 'package:rishtaaunty/pages/app_page2.dart';
import 'package:rishtaaunty/utils/utils.dart';
import 'package:flutter/services.dart';
import 'package:rishtaaunty/repositories/base_repository.dart';

part 'package:rishtaaunty/blocs/app/app_event.part.dart';
part 'package:rishtaaunty/blocs/app/app_state.part.dart';

class BaseBloc extends Bloc<BaseEvent,BaseState> {
  BaseBloc({this.repositories});
  List<RepositoryBase> repositories;
  //AppModel appData;
  MenuBloc menuBloc;
  Router router;

  @override
  BaseState get initialState => BaseStateNew();

  @override
  Stream<BaseState> mapEventToState(BaseEvent<BaseEvent> event) async* {
 /*   if (event is BaseEventStartup) {
      yield BaseStateNew();
    }
  }*/
}

/*
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(
      {@required this.remoteConfigKey, @required this.jsonKey, this.appKey}) {
    dispatch(AppEventStartup());
  }

  String remoteConfigKey, jsonKey;
  AppModel appData;
  MenuBloc menuBloc;
  Router router;

  @override
  AppState get initialState => AppStateNew();

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    print('APP_START: EVENT=${event} STATE=${currentState}');
    if (event is AppEventStartup) {
      yield AppStateNew();

      menuBloc = MenuBloc(appBloc: this);
      _appPage = _newAppPage();
      dispatch(AppEventUpdate());
    }
    if (event is AppEventUpdate) {
      yield AppStateUpdating();
      try {
/*        AssetRepository assetRepository = AssetRepository(
            jsonAssetFilename: 'assets/rishtaaunty_dev.json', jsonKey: jsonKey);
        appData = await assetRepository.read();
        menuBloc.dispatch(MenuEventUpdate()); */

        /*      FirebaseRepository firebaseRepository = FirebaseRepository(
            remoteConfigKey: remoteConfigKey, jsonKey: jsonKey);
print(firebaseRepository.data);
        appData = await firebaseRepository.read(); */
/*
        FirebaseUtils.activateThenFetch();
        Map configJson =
            await FirebaseUtils.getJson(remoteConfigKey: remoteConfigKey);
        print(configJson);
        appData = AppModel.fromJson(await configJson[jsonKey]);
        FirebaseUtils.setDebugMode(appData.remoteConfigDebugMode);
*/
        Map configJson =
            jsonDecode(await rootBundle.loadString('assets/rishtaaunty_dev.json'));
        appData = AppModel.fromJson(await configJson[jsonKey]);

        yield AppStateUpdated();
      } on Exception catch (error) {
        yield AppStateError(error);
        print('EXCEPTION: $error');
      }
    }
    print('APP_END: EVENT=${event} STATE=${currentState}');
  }

  AppPage _newAppPage({Key key}) {
    this.appKey = key;
    return _appPage = AppPage(key: this.appKey, appBloc: this);
  }
}
*/
