import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

abstract class BaseRepository {
  final String name;
  final bool cache;

  BaseRepository({@required this.name, this.cache = true});

  dynamic getData();
}
