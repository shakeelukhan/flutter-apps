import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../pages/login.dart';

var rootHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return LoginPage();
    });

class AppRoutes {
  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          print('ROUTE WAS NOT FOUND !!!');
        });
    router.define(LoginPage.PATH, handler: rootHandler);
    router.define(LoginPage.PATH + '2', handler: counterHandler);
    router.define('/', handler: rootHandler);
  }
}
