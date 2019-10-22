import 'package:flutter/material.dart';

class StatefulWidgets {
  Widget app(Widget widget) => MaterialApp(home: widget);
  Widget circularProgress() => CircularProgressIndicator();
  Widget scaffold(Widget widget) => Scaffold(body: widget);
}