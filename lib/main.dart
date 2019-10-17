import 'package:flutter/material.dart';
import 'package:rishtaaunty/blocs/app/app_bloc.dart';
import 'package:rishtaaunty/utils/logger_utils.dart';

void main() async {
  LoggerUtils.setLoggerLevelInfo();

  try {
    AppBloc appBloc = AppBloc();
 //   AppBloc appBloc = AppBloc(remoteConfigKey: 'rishtaaunty_dev', jsonKey: 'app');
  //  return runApp(appBloc.page);
  } catch (err) {
    LoggerUtils.logger.e(err.toString());
  }
}
