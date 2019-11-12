import 'package:flutter/material.dart';
import 'package:rishtaaunty/utils/utils.dart' as u;
import 'app.dart';

void main() async {
  try {
    runApp(App.fromConfig('rishta_aunty_local'));
  } catch (err) {
    u.log.logger.e(err);
  }
}
