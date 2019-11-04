import 'dart:async';
import 'package:meta/meta.dart';
import 'package:rishtaaunty/utils/io_util.dart';

abstract class BaseDatasource {
  final String key;

  BaseDatasource({@required this.key});

  Future<String> getString();

  Future<dynamic> getJson() async => ioUtil.stringToJson(await getString());
}
