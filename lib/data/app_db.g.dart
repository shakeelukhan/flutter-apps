// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class AppData extends DataClass implements Insertable<AppData> {
  final String name;
  final String version;
  AppData({@required this.name, this.version});
  factory AppData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return AppData(
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      version:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}version']),
    );
  }
  factory AppData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return AppData(
      name: serializer.fromJson<String>(json['name']),
      version: serializer.fromJson<String>(json['version']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'name': serializer.toJson<String>(name),
      'version': serializer.toJson<String>(version),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<AppData>>(bool nullToAbsent) {
    return AppDataCompanion(
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      version: version == null && nullToAbsent
          ? const Value.absent()
          : Value(version),
    ) as T;
  }

  AppData copyWith({String name, String version}) => AppData(
        name: name ?? this.name,
        version: version ?? this.version,
      );
  @override
  String toString() {
    return (StringBuffer('AppData(')
          ..write('name: $name, ')
          ..write('version: $version')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(name.hashCode, version.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is AppData &&
          other.name == this.name &&
          other.version == this.version);
}

class AppDataCompanion extends UpdateCompanion<AppData> {
  final Value<String> name;
  final Value<String> version;
  const AppDataCompanion({
    this.name = const Value.absent(),
    this.version = const Value.absent(),
  });
  AppDataCompanion.insert({
    @required String name,
    this.version = const Value.absent(),
  }) : name = Value(name);
  AppDataCompanion copyWith({Value<String> name, Value<String> version}) {
    return AppDataCompanion(
      name: name ?? this.name,
      version: version ?? this.version,
    );
  }
}

class AppDataTable extends Table with TableInfo<AppDataTable, AppData> {
  final GeneratedDatabase _db;
  final String _alias;
  AppDataTable(this._db, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        $customConstraints: 'NOT NULL PRIMARY KEY');
  }

  final VerificationMeta _versionMeta = const VerificationMeta('version');
  GeneratedTextColumn _version;
  GeneratedTextColumn get version => _version ??= _constructVersion();
  GeneratedTextColumn _constructVersion() {
    return GeneratedTextColumn('version', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [name, version];
  @override
  AppDataTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'appData';
  @override
  final String actualTableName = 'appData';
  @override
  VerificationContext validateIntegrity(AppDataCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.version.present) {
      context.handle(_versionMeta,
          version.isAcceptableValue(d.version.value, _versionMeta));
    } else if (version.isRequired && isInserting) {
      context.missing(_versionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  AppData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return AppData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(AppDataCompanion d) {
    final map = <String, Variable>{};
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.version.present) {
      map['version'] = Variable<String, StringType>(d.version.value);
    }
    return map;
  }

  @override
  AppDataTable createAlias(String alias) {
    return AppDataTable(_db, alias);
  }

  @override
  final bool dontWriteConstraints = true;
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  AppDataTable _appData;
  AppDataTable get appData => _appData ??= AppDataTable(this);
  AppData _rowToAppData(QueryRow row) {
    return AppData(
      name: row.readString('name'),
      version: row.readString('version'),
    );
  }

  Selectable<AppData> getAllAppData() {
    return customSelectQuery('SELECT * FROM appData',
        variables: [], readsFrom: {appData}).map(_rowToAppData);
  }

  @override
  List<TableInfo> get allTables => [appData];
}
