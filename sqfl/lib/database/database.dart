import 'package:sqfl/model/note.dart';
import 'package:sqflite/sqflite.dart';

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
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
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
