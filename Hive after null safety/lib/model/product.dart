import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 3)
class ProductModel extends HiveObject {
  @HiveField(0)
  late String productName;

  @HiveField(1)
  late double price;

  ProductModel({required this.productName, required this.price});
}

/// save then run
/// flutter packages pub run build_runner build --delete-conflicting-outputs