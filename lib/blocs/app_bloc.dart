import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rishtaaunty/utils/firebase_remote_config.dart';
import 'package:rishtaaunty/models/app_model.dart';

part '../app/app_event.dart';
part '../app/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  String remoteConfigKey, jsonKey;
  FirebaseRemoteConfig firebaseRemoteConfig;
  AppModel appData;
  Router router;

  AppBloc({@required this.remoteConfigKey, @required this.jsonKey}) {
    firebaseRemoteConfig = new FirebaseRemoteConfig();
    dispatch(AppEventStartup());
  }

  @override
  AppState get initialState => AppStateNew();

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is AppEventUpdate) {
      try {
        firebaseRemoteConfig.activateThenFetch();
        Map configJson =
            await firebaseRemoteConfig.getJson(key: remoteConfigKey);
        appData = AppModel.fromJson(await configJson[jsonKey]);
        firebaseRemoteConfig.setDebugMode(appData.remoteConfigDebugMode);
        yield AppStateUpdated();
      } on Exception catch (error) {
        yield AppStateError(error);
        print('EXCEPTION: $error');
      }
    }
  }
}
