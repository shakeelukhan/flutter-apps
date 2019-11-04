import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

abstract class BaseRepository {
  final String name;
  final bool cache;

  get datasource;
  get data;

  BaseRepository({@required this.name, this.cache = true});

  getData();
}
