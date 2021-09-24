import 'package:get/get.dart';
import 'package:get_x/model/list_model.dart';
import 'package:get_x/model/user.dart';

class ProductController extends GetxController {
  List<ProductsModel> products = <ProductsModel>[].obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    // await Future.delayed(Duration(seconds: 2));
    getData();
  }

  void getData() {
    print('called');
    products = List.of(data).obs;
  }
}
