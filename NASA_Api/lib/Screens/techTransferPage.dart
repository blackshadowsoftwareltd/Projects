import 'package:flutter/material.dart';
import 'package:nas/helper/TechTransferHelper.dart';
import 'package:nas/model/TechTransfer.dart';

class TechTransferPage extends StatefulWidget {
  @override
  _TechTransferPageState createState() => _TechTransferPageState();
}

class _TechTransferPageState extends State<TechTransferPage> {
  Future<TechTransferModel> techModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    techModel = TechTransferHelper().getInfo();
    print(techModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('TechTransfer Info from NASA')),
        body: Container(
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder<TechTransferModel>(
                future: techModel,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        padding: EdgeInsets.all(5),
                        itemCount: snapshot.data.results.length,
                        itemBuilder: (context, index) {
                          print(snapshot.data.total);
                          var result = snapshot.data.results[index];
                          return Column(
                            children: [
                              TechTransferInfo(
                                  snapshot.data.count,
                                  snapshot.data.total,
                                  snapshot.data.perpage,
                                  snapshot.data.page),
                              TechTransferResult(result)
                            ],
                          );
                        });
                  } else
                    return Center(child: CircularProgressIndicator());
                })));
  }

  Widget TechTransferInfo(int count, int total, int perpage, int page) =>
      Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(5),
          color: Colors.blue[50],
          child: Column(children: [
            Text('Count : $count'),
            Text('Total : $total'),
            Text('PerPage : $perpage'),
            Text('Page : $page')
          ]));
  Widget TechTransferResult(var result) {
    final allResult = result.map((result) {
      final data = result.toString();

      return data.contains('http')
          ? Container(
              padding: const EdgeInsets.all(5), child: Image.network(data))
          : Container(padding: const EdgeInsets.all(5), child: Text(data));
    }).toList();
    return Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        color: Colors.blue[50],
        child: Column(children: [...allResult]));
  }
}
