import 'dart:async';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import './base_datasource.dart';

class AssetDatasource extends BaseDatasource {
  bool _cache;
  Completer _ioCompleter;

  AssetDatasource({@required String key, bool cache}) : super(key: key) {
    _cache = cache ?? true;
  }

  Future<String> getString() async {
    await _ioCompleter?.future;
    _ioCompleter = Completer<String>();
    _ioCompleter.complete(rootBundle.loadString(this.key, cache: _cache));
    return _ioCompleter.future;
  }
}
