import 'package:moor_flutter/moor_flutter.dart';

part 'app_db.g.dart';

@UseMoor(
  include: {'app_tables.moor'},
)
class AppDb extends _$AppDb {
  AppDb() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'app.db'));

  @override
  int get schemaVersion => 1;
}
