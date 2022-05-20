import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'pages/home_page.dart';

final router = Router();

class Routes {
  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    router.define('/', handler: rootHandler);
    router.define(Home.PATH, handler: homeHandler);
  }
}

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Home();
    });

var homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Home(text: 'FROM HOME');
    });

var homeHandler2 = Handler(type: HandlerType.function,
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('abc');
    });
