import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rishtaaunty/old_files/widgets/HomeWidget.dart';

var homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  //   print('PARAMS = ${params["id"][0]}');
  return Home();
});

var homeHandler2 = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  //   print('PARAMS = ${params["id"][0]}');
  return Home2();
});

var appHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  // return AppScreen(title: 'dummy');
});

class AppRoutes {
  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('ROUTE WAS NOT FOUND !!!');
      print('${params.toString()}');
    });
    //   router.define(AppScreen.PATH, handler: appHandler);
    //  router.define(Home.PATH, handler: homeHandler);
    // router.define(Home2.PATH, handler: homeHandler2);
    //router.define('/', handler: appHandler);
  }
}
