import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rishtaaunty/utils/firebase_utils.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  String remoteConfigKey, jsonKey;

  MenuBloc({@required this.remoteConfigKey, @required this.jsonKey}) {
    dispatch(MenuEventStartup());
  }

  @override
  MenuState get initialState => MenuStateNew();

  @override
  Stream<MenuState> mapEventToState(MenuEvent event) async* {
    if (event is MenuEventUpdate) {
      try {
        yield MenuStateUpdated();
      } on Exception catch (error) {
        yield MenuStateError(error);
        print('EXCEPTION: $error');
      }
    }
  }
}
