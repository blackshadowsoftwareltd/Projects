import 'package:hive/hive.dart';

part 'datas.g.dart';

@HiveType(typeId: 2)
class Person {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late int age;

  @HiveField(2)
  late List<Person> friends;
}
/// save then run
/// flutter packages pub run build_runner build --delete-conflicting-outputs