import 'dart:async';
import 'package:bloc/bloc.dart';
import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rishtaaunty/models/app_model.dart';
import 'package:rishtaaunty/pages/app_page.dart';
import 'package:rishtaaunty/utils/firebase_utils.dart';
import 'package:flutter/services.dart';
import 'package:json_serializable/builder.dart';
import 'package:json_serializable/json_serializable.dart';
import 'package:built_value/json_object.dart';

part 'package:rishtaaunty/blocs/app/app_event.part.dart';
part 'package:rishtaaunty/blocs/app/app_state.part.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(
      {@required this.remoteConfigKey, @required this.jsonKey, this.appKey}) {
    _appPage = _newAppPage();
    dispatch(AppEventStartup());
  }

  String remoteConfigKey, jsonKey;
  Key appKey;
  AppPage _appPage;
  AppModel appData;
  Router router;

  AppPage get appPage => _appPage;

  @override
  AppState get initialState => AppStateNew();

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is AppEventStartup) {
      yield AppStateNew();
      dispatch(AppEventUpdate());
      yield AppStateUpdating();
    }
    if (event is AppEventUpdate) {
      yield AppStateUpdating();
      try {
   //     FirebaseUtils.activateThenFetch();
    //    Map configJson = await FirebaseUtils.getJson(key: remoteConfigKey);

        Map configJson = jsonDecode(await rootBundle.loadString('assets/app.json'));
        print('APP = ${configJson}');


        appData = AppModel.fromJson(await configJson[jsonKey]);
//        FirebaseUtils.setDebugMode(appData.remoteConfigDebugMode);
        yield AppStateUpdated();
      } on Exception catch (error) {
        yield AppStateError(error);
        print('EXCEPTION: $error');
      }
    }
  }

  AppPage _newAppPage({Key key}) {
    this.appKey = key;
    return _appPage = AppPage(key: this.appKey, appBloc: this);
  }
}
