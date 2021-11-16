import 'dart:convert';

const String tableNotes = 'Notes';

class NoteFields {
  static const List<String> values = [
    id,
    isImportant,
    number,
    title,
    description,
    time
  ];

  static const String id = '_id';
  static const String isImportant = 'isImportant';
  static const String number = 'number';
  static const String title = 'title';
  static const String description = 'description';
  static const String time = 'time';
}

class Note {
  final int? id;
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;

  Note(
      {this.id,
      required this.isImportant,
      required this.number,
      required this.title,
      required this.description,
      required this.createdTime});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isImportant': isImportant ? 1 : 0,
      'number': number,
      'title': title,
      'description': description,
      'createdTime': createdTime.millisecondsSinceEpoch,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
        id: map['id'] ?? map['id'] as int?,
        isImportant: map['isImportant'] as bool,
        number: map['number'] as int,
        title: map['title'] as String,
        description: map['description'] as String,
        createdTime: DateTime.fromMillisecondsSinceEpoch(map['createdTime']));
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source));

  Note copyWith({
    int? id,
    bool? isImportant,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,
  }) {
    return Note(
      id: id ?? this.id,
      isImportant: isImportant ?? this.isImportant,
      number: number ?? this.number,
      title: title ?? this.title,
      description: description ?? this.description,
      createdTime: createdTime ?? this.createdTime,
    );
  }
}
