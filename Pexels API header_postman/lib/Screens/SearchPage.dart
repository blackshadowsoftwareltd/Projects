import 'package:flutter/material.dart';
import 'package:pex/Components/DemoView.dart';
import 'package:pex/Helper/SearchHelper.dart';
import 'package:pex/Model/ReUsableModel.dart';

class SearchPage extends StatefulWidget {
  final String queryText;

  const SearchPage({Key key, this.queryText}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ///
  Future<ReUsableModel> trendingModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trendingModel = SearchHelper().getSearchImage(widget.queryText);
    print(trendingModel);
  }

  @override
  Widget build(BuildContext context) {
    /// At this moment, Expanded is the best solution for RenderFlex overflow.
    return Scaffold(
          body: FutureBuilder<ReUsableModel>(
        future: trendingModel,
        builder: (context, snapshot) {
          if (snapshot.hasError)
            print('error');
          else if (snapshot.hasData)
            return Scrollbar(
              showTrackOnHover: true,
              thickness: 7,
              hoverThickness: 7,
              isAlwaysShown: true,
              radius: Radius.circular(20),
              child: GridView.builder(
                  padding: EdgeInsets.all(3),
                  shrinkWrap: true,
                  itemCount: snapshot.data.photos.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 2 / 2.9),
                  itemBuilder: (context, index) {
                    var url = snapshot.data.photos[index].src.portrait;
                    var original = snapshot.data.photos[index].src.original;
                    var author = snapshot.data.photos[index].photographer;
                    return DemoView(
                      url: url,
                      author: author,
                      originalImage: original,
                    );
                  }),
            );
          else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
