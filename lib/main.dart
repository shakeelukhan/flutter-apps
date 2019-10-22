import 'package:flutter/material.dart';
import 'package:rishtaaunty/blocs.dart';
import 'package:rishtaaunty/models.dart';
import 'package:rishtaaunty/repositories.dart';
import 'package:rishtaaunty/utils.dart';

void main() async {
  U.log.setSimplePrinter();
  U.log.setLoggerLevelWarning();

  try {
    runApp(WidgetBloc<AppModel>(repository: R.defaultAssetAppRepository)
        .getWidget(Text('abc')));
  } catch (err) {
    U.log.logger.e(err.toString());
  }
}
