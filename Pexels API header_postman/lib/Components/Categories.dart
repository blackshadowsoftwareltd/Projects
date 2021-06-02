import 'package:flutter/material.dart';
import 'package:pex/Model/CategoriesModel.dart';
import 'package:pex/Screens/SearchPage.dart';
import '../Resources/data.dart';

class CategoriesPanle extends StatelessWidget {
  List<CategoriesModel> data = List.of(getCagetories);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Buttons(context, '${data[0].categoriesName}'),
              Buttons(context, '${data[1].categoriesName}'),
              Buttons(context, '${data[2].categoriesName}'),
              Buttons(context, '${data[3].categoriesName}'),
              Buttons(context, '${data[4].categoriesName}'),
              Buttons(context, '${data[5].categoriesName}'),
            ])));
  }

  Widget Buttons(
    BuildContext context,
    String label,
  ) =>
      Container(
          width: 80,
          height: 30,
          child: TextButton(
              child: Text(label),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchPage(
                            queryText: label.toLowerCase(),
                          )))));
}
