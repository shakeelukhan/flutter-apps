import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';

final router = FluroRouter();

class Routes {
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      debugPrint("ROUTE WAS NOT FOUND !!!");
      return null;
    });
    router.define('/', handler: rootHandler);
    router.define(Home.path, handler: homeHandler);
  }
}

var rootHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const Home();
});

var homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const Home(text: 'FROM HOME');
});
