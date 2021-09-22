import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
  late String userName;

  @HiveField(1)
  late int userId;

  @HiveField(2)
  late List<User> usersList;

  User({required this.userName, required this.userId, required this.usersList});
}

/// save then run
/// flutter packages pub run build_runner build --delete-conflicting-outputs