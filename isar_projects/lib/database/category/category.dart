import 'package:isar/isar.dart';

part 'category.g.dart';

@Collection()
class Category {
  @Id()
  int id = Isar.autoIncrement;

  @Index(unique: true) // unique index
  late String name;
}
