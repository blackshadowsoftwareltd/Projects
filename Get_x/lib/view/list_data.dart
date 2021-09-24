import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/controller/controller.dart';

import 'data_insert.dart';

class ListDataVeiw extends StatelessWidget {
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('List Data')),
        body: Container(
          child: GetX<ProductController>(
            builder: (controller) => ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  final data = controller.products[index];
                  return Container(
                    color: Colors.green.shade100,
                    margin: EdgeInsets.all(10),
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(data.product),
                        Text(data.price.toString())
                      ],
                    ),
                  );
                }),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () => Navigator.push(context,
                CupertinoPageRoute(builder: (context) => DataInsertScreen())),
            label: Text('Data Insert Screen')));
  }
}
