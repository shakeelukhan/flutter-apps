import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:rishtaaunty/data/data.dart' as d;

class AppWidget extends StatefulWidget {
  final d.AppModel data;
  final Widget widget;
  AppWidget({this.data, this.widget, Key key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      showSemanticsDebugger: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
          centerTitle: true,
        ),
        body: widget.widget,
      ),
    );
  }
}

var homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('PARAMS = ${params["id"][0]}');
  // return Home();
});

class AppRoutes {
  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('ROUTE WAS NOT FOUND !!!');
      print('${params.toString()}');
    });
    //  router.define(Home.PATH, handler: homeHandler);
    //router.define('/', handler: appHandler);
  }
}
