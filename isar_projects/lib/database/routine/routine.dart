import 'package:isar/isar.dart';
import 'package:isar_projects/database/category/category.dart';

part 'routine.g.dart';

@Collection()
class Routine {
  @Id()
  int id = Isar.autoIncrement;

  late String title;

  @Index() //? index keyward for sorting
  late DateTime startTime;

  @Index(caseSensitive: false) //? case insensitive index
  late String day;

  @Index(composite: [CompositeIndex('title')]) //? composit index
  final category = IsarLink<Category>();
}
