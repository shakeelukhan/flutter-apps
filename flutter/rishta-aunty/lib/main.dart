import 'package:flutter/material.dart';
import 'package:rishta_aunty/tools/tools.dart' as t;
import 'package:rishta_aunty/ui/ui.dart' as u;

void main() async {
  try {
    runApp(u.App.fromConfig('rishta_aunty_local'));
  } catch (err) {
    t.log.logger.e(err);
  }
}
