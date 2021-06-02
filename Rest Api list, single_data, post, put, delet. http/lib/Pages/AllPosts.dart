import 'package:flutter/material.dart';
import 'package:rest/helper/apiHelper.dart';
import 'package:rest/models/postModel.dart';

class AllPost extends StatelessWidget {
  final Future<List<PostModel>> postModel = APIHelper().fetchProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Posts')),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<List<PostModel>>(
            future: postModel,
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              if (snapshot.hasData) {
                return ProductBoxList(items: snapshot.data);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}

class ProductBoxList extends StatelessWidget {
  final List<PostModel> items;

  ProductBoxList({Key key, this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          // height: 50,
          // width: 20,
          color: Colors.green[100], padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(5),
          // child: Posts(post: items[index],),
          child: Column(
            children: [
              Text('${items[index].title}'),
              Divider(height:5, thickness: 1, color: Colors.green),
              Text('${items[index].body}'),
            ],
          ),
        );
      },
    );
  }
}
