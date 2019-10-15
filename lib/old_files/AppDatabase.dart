import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_memory.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class AppDatabase {
  String path;
  Database db;
  var store;

  init({int dbVersion, String dbPath}) async {
    path = (dbPath == null)
        ? join((await getApplicationDocumentsDirectory()).path, 'app2.db')
        : dbPath;
    delete(path: path);
    db = await databaseFactoryIo.openDatabase(path);
    store = StoreRef.main();
  }

  Future<dynamic> terminate() async {
    return (await db).close();
  }

  delete({String path}) async {
    path = (path == null)
        ? join((await getApplicationDocumentsDirectory()).path, 'app.db')
        : path;
    if (path != null && await Directory(dirname(path)).exists()) {
      databaseFactoryIo.deleteDatabase(path);
    }
  }

  test() async {
    await store.record('title').put(await db, 'Simple application');
    await store.record('version').put(await db, 10);
    await store.record('settings').put(await db, {'offline': true});
    var title = await store.record('title').get(await db) as String;
    var version = await store.record('version').get(await db) as int;
    var settings = await store.record('settings').get(await db) as Map;
    await store.record('version').delete(await db);
    print('DELETED');
  }

  void test2() async {
    DatabaseFactory databaseFactory = databaseFactoryIo;
    databaseFactory.openDatabase(path,
        onVersionChanged: (db, oldVersion, newVersion) =>
            print('onVersionChanged: OLD=${oldVersion} NEW=${newVersion}'));
    StoreRef.main();
    store.add(db, {
      "name": {"first": "Maria", "last": "Smith", "version": 1},
      "age": 20,
      "active": false,
      "version": 2
    });

    print(await store.record('title').put(db, 'Simple application'));
    print(await store.record('version').put(db, 10));
    var key = await store.record('settings').put(db, {'offline': true});
    print(await store.find(db,
        finder: Finder(filter: Filter.inList('version', [2]))));
    var record = await store.record(key).getSnapshot(db);
    print(record.toString());
    print(await store.find(db, finder: Finder(filter: Filter.byKey('title'))));
  }
}
