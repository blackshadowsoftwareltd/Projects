import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'boxes.dart';
import 'dialog.dart';
import 'model/product.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String? productName;
  double? price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Product Screen')),
        body: Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoTextField(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      placeholder: 'Product Name',
                      onChanged: (text) => setState(() => productName = text))),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoTextField(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      placeholder: 'Price',
                      keyboardType: TextInputType.number,
                      onChanged: (text) =>
                          setState(() => price = double.parse(text)))),
              Container(
                  child: CupertinoButton(
                      child: Container(
                          width: double.infinity,
                          color: Colors.white,
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child: Text('Add')),
                      onPressed: () async {
                        if (productName != null &&
                            productName!.isNotEmpty &&
                            price != null) {
                          final data = ProductModel(
                              productName: productName!, price: price!);

                          ///
                          final box = Boxes.getProductBox();
                          box.add(data);

                          /// add data using key
                          // box.put('key', data);// with key
                        }
                      })),
              Expanded(
                  child: ValueListenableBuilder<Box<ProductModel>>(
                valueListenable: Boxes.getProductBox().listenable(),
                builder: (context, box, _) {
                  final data = box.values.toList().cast<ProductModel>();
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        print(data[index].productName);
                        final product = data[index];
                        return zContent(product, index);
                      });
                },
              ))
            ])));
  }

  Widget zContent(ProductModel data, index) => Container(
      margin: EdgeInsets.all(5),
      color: Colors.green.shade100,
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Name: ${data.productName}'),
          Spacer(flex: 1),
          Text('Price: ${data.price}'),
          Spacer(flex: 1),
          IconButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddUpdateDialog(
                      productModel: data,
                      onClicked: (productName, price) {
                        data.productName = productName;
                        data.price = price;
                        data.save();

                        /// update data using key
                        // final box = Boxes.getProductBox();
                        // box.put(data.key, data);
                      }))),
              icon: Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                data.delete();

                /// delete data using key
                // final box = Boxes.getProductBox();
                // box.delete(data.key);
              },
              icon: Icon(Icons.delete)),
        ],
      ));
}
