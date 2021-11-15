import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static final _dbName = 'Databases.db';
  static final _dbVersion = 1;
  static final _dbTableName = 'DBTable';
  static final dbColumnId = '_id';
  static final dbColumnName = 'name';

  /// making it a singleton class
  DataBaseHelper._privateConstructor();

  static final DataBaseHelper instance = DataBaseHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initiateDatabase();
    return _database;
  }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName); // the join method is depend of the import 'package:path/path.dart';
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  /// CREATING DATABASE TABLE
  Future _onCreate(Database db, int version) {
    db.execute('''
      CREATE TABLE $_dbTableName(
      $dbColumnId INTEGER PRIMARY KEY,
      $dbColumnName TEXT NOT NULL)
      ''');
  }

  /// insert data in this database table
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_dbTableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(_dbTableName);
  }

  /// update method
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[dbColumnId];
    return await db
        .update(_dbTableName, row, where: '$dbColumnId=?', whereArgs: [id]);
  }

  /// delete data from database
  Future<int> delets(int id) async {
    Database db = await instance.database;
    return await db
        .delete(_dbTableName, where: '$dbColumnId=?', whereArgs: [id]);
  }
}
