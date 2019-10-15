import 'package:flutter/material.dart';
import 'package:rishtaaunty/blocs/app/app_bloc.dart';

void main() async {
  AppBloc appBloc = AppBloc(remoteConfigKey: 'rishtaaunty_dev', jsonKey: 'app');
  return runApp(appBloc.appPage);
}
