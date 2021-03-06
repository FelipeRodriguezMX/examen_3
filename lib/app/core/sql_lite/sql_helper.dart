import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class ISqlHelper {
  Future<void> database();
  Future<int> insert({required String query});
  Future<bool> edit({required String query});
  Future<List<Map<String, Object?>>> get(String query);
}

class SQLHelperImplementation implements ISqlHelper {
  Database? _db;

  @override
  Future<Database> database() async {
    if (_db != null) return _db!;
    _db = await _initDB('examen.db');
    return _db!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _onCreateDB);
  }

  Future<void> _onCreateDB(Database db, int version) async {
    db.execute(
        '''CREATE TABLE Producers (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT )''');

    db.execute(
      '''CREATE TABLE Actors (id INTEGER PRIMARY KEY  AUTOINCREMENT, name TEXT , alias TEXT )''',
    );
    db.execute(
      '''CREATE TABLE Movies (id INTEGER PRIMARY KEY  AUTOINCREMENT, name TEXT, description TEXT, producer_id INTEGER, FOREIGN KEY(producer_id) REFERENCES Producers(id))''',
    );
    db.execute(
        '''CREATE TABLE MovieActors (id INTEGER PRIMARY KEY  AUTOINCREMENT, movie_id INTEGER , actor_id INTEGER , FOREIGN KEY(movie_id) REFERENCES Movies(id), FOREIGN KEY(actor_id) REFERENCES Actors(id))''');
  }

  @override
  Future<bool> edit({required String query}) async {
    final result = await _db!.rawUpdate(query);
    return (result >= 0) ? true : false;
  }

  @override
  Future<List<Map<String, dynamic>>> get(String query) async {
    _db ??= await database();
    final result = await _db!.rawQuery(query);
    return result;
  }

  @override
  Future<int> insert({
    required String query,
  }) async {
    _db ??= await database();

    final result = await _db!.rawInsert(query);
    return (result >= 0) ? result : 0;
  }
}
