import 'package:flutter/material.dart';

class StatefulWidgets {
  static Widget app(Widget widget) => MaterialApp(home: widget);
  static Widget circularProgress() => CircularProgressIndicator();
  static Widget scaffold(Widget widget) => Scaffold(body: widget);
}
