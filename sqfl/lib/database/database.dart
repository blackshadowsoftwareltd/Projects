import 'package:sqfl/model/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();
  static Database? _database;

  /// init constractor
  NotesDatabase._init();

  ///
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB('notes.db');
    return _database!;
  }

  ///
  Future<Database> _initDB(String filePath) async {
    var dbPath = await getDatabasesPath();
    var path = join(dbPath,
        filePath); // the join method is depend of the import 'package:path/path.dart';
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  /// create db
  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY EY AUTOINCREMENT';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';
    final textType = 'TEXT NOT NULL';
    await db.execute('''
  CREATE TABLE $tableNotes(
${NoteFields.id}$idType,
${NoteFields.isImportant}$boolType,
${NoteFields.number}$integerType,
${NoteFields.title}$textType,
${NoteFields.description}$textType,
${NoteFields.time}$textType,
  )
  ''');
  }

  /// close db
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
