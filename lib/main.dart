import 'package:flutter/material.dart';
import 'package:rishtaaunty/tools/tools.dart' as t;
import 'package:rishtaaunty/ui/ui.dart' as u;

void main() async {
  try {
    runApp(u.App.fromConfig('rishta_aunty_local'));
  } catch (err) {
    t.log.logger.e(err);
  }
}
