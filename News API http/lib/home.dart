import 'package:flutter/material.dart';
import 'package:news/news_model.dart';

import 'api_manager.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<NewsModel> _newsModel;

  @override
  void initState() {
    // TODO: implement initState.
    super.initState();
    _newsModel = API_Manager().getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('News'), backgroundColor: Colors.grey[300]),
      body: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: FutureBuilder<NewsModel>(
          future: _newsModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.articles.length,
                itemBuilder: (context, index) {
                  var article = snapshot.data.articles[index];
                  return Contents(article);
                },
              );
            } else
              return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget Contents(var article) => Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(10),
        color: Colors.grey[100],
        // height: 220,
        child: Column(children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 180,
              child: Image.network(article.urlToImage, fit: BoxFit.cover)),
          Container(
              padding: EdgeInsets.all(5),
              child: Text('${article.title}', overflow: TextOverflow.fade)),
          Divider(height: 3, thickness: 1, color: Colors.grey[300]),
          Container(
            padding: EdgeInsets.all(3),
            child: Text('${article.description}',overflow: TextOverflow.ellipsis,),
          )
        ]),
      );
}
