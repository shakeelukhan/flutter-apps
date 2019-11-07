import 'package:flutter/material.dart';
import 'package:rishtaaunty/blocs/blocs.dart' as b;
import 'package:rishtaaunty/utils/utils.dart' as u;
import './app.dart';

void main() async {
  try {
    runApp(App(b.AppBloc.fromConfig('rishtaaunty_dev', true, false)));
  } catch (err) {
    u.log.logger.e(err);
  }
}
