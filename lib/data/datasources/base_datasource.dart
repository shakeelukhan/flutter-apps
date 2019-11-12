import 'dart:async';

abstract class BaseDatasource {
  Future<String> getString();

  Future<dynamic> getJson();
}
