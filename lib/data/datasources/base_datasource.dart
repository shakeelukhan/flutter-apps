import 'dart:async';
import 'package:rishtaaunty/utils/io_util.dart';

abstract class BaseDatasource {
  final String key;
  final bool cache;

  BaseDatasource(this.key, {this.cache = true});

  Future<String> getString();

  Future<dynamic> getJson() async => ioUtil.stringToJson(await getString());
}
