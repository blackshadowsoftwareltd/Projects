import 'package:hive/hive.dart';

part 'todo_adapter.g.dart';

@HiveType(typeId: 1)
class Todo extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String description;

  Todo({required this.title, required this.description});
}

/// save then run
/// flutter packages pub run build_runner build --delete-conflicting-outputs