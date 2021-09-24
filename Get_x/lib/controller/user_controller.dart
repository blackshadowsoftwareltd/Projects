import 'package:get/get.dart';
import 'package:get_x/model/user.dart';

class UsersController extends GetxController {
  List<Users> userList = <Users>[].obs;
  int get userLength => userList.length;
  double get totalAge => userList.fold(0, (sum, item) => sum + item.age!);

  ///
  void setUser(String name, int age) {
    userList.add(Users(name: name, age: age));

    userList.map((e) => print(e.name)).toList();
  }
}
