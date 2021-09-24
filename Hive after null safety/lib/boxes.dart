import 'package:hive_flutter/hive_flutter.dart';
import 'package:hivez/model/product.dart';

class Boxes {
  static Box<ProductModel> getProductBox() => Hive.box<ProductModel>('product');
}
