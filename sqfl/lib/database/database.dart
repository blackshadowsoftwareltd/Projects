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
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const boolType = 'BOOLEAN NOT NULL';
    const integerType = 'INTEGER NOT NULL';
    const textType = 'TEXT NOT NULL';
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

  Future<Note> create(Note note) async {
    final db = await instance.database;

    ///
    // final json=note.toJson();
    // final column='${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values='${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id=await db.rawInsert('INSERT INTO table_name ($column) VALUES ($values)');

    /// same things like under this line

    final id = await db.insert(tableNotes, note.toMap());
    return note.copyWith(id: id);
  }

  /// read single note
  Future<Note> readNote(int id) async {
    final db = await instance.database;

    final maps = await db.query(tableNotes,
        columns: NoteFields.values,
        where: '${NoteFields.id}=?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Note.fromMap(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  /// read multiple notes
  Future<List<Note>> readAllNotes(int id) async {
    final _db = await instance.database;
    final _orderBy = '${NoteFields.time} ASC';

    ///
    // final _result =
    //     await _db.rawQuery('SENECT * FROM $tableNotes ORDER BY $_orderBy');
    ///same things like under this line

    final _result = await _db.query(tableNotes, orderBy: _orderBy);
    return _result.map((json) => Note.fromMap(json)).toList();
  }

  Future<int> update(Note note) async {
    final _db = await instance.database;

    return _db.update(
      tableNotes,
      note.toMap(),
      where: '${NoteFields.id}=?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    final _db = await instance.database;
    return await _db
        .delete(tableNotes, where: '${NoteFields.id}=?', whereArgs: [id]);
  }

  /// close db
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
