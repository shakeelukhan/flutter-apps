import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rishtaaunty/blocs.dart';
import 'package:rishtaaunty/models.dart';

class AppWidget extends StatefulWidget {
  AppWidget({Key key, this.appData}) : super(key: key);

  final AppModel appData;

  @override
  _AppWidgetState createState() {
    return _AppWidgetState();
  }
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = widget.appData.debugPaintSizeEnabled;
    debugPaintPointersEnabled = widget.appData.debugPaintPointersEnabled;
    return MaterialApp(
        title: widget.appData.title,
        debugShowCheckedModeBanner: widget.appData.debugShowCheckedModeBanner,
        showPerformanceOverlay: widget.appData.showPerformanceOverlay,
        showSemanticsDebugger: widget.appData.showSemanticsDebugger,
        theme: ThemeData(primarySwatch: Colors.orange),
        home: Scaffold(
            appBar: AppBar(
              title: Text(widget.appData.title),
              centerTitle: true,
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.more_vert),
                ),
              ],
            ),
            body: Container(
              alignment: Alignment.center,
              child: Scaffold(body: Text('abc')),
            )));
  }
}
