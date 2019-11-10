import 'dart:async';
import 'package:flutter/services.dart';
import './base_datasource.dart';

class AssetDatasource extends BaseDatasource {
  Completer _ioCompleter;

  AssetDatasource(String key, {bool cache = true}) : super(key, cache: cache);

  Future<String> getString() async {
    await _ioCompleter?.future;
    _ioCompleter = Completer<String>();
    _ioCompleter.complete(rootBundle.loadString(this.key, cache: this.cache));
    return _ioCompleter.future;
  }
}
