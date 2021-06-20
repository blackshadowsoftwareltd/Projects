import 'package:flutter/material.dart';
import 'package:nas/helper/EarthHelper.dart';
import 'package:nas/model/earthModel.dart';

class TheEarth extends StatefulWidget {
  @override
  _TheEarthState createState() => _TheEarthState();
}

class _TheEarthState extends State<TheEarth> {
  Future<Earth> earthData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    earthData = fetchEarth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('The Earth data from NASA')),
      body: FutureBuilder(
        future: earthData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return earthContent(
                snapshot.data.id,
                snapshot.data.date,
                snapshot.data.serviceVersion,
                snapshot.data.url,
                snapshot.data.resource);
          } else if (snapshot.hasError) return Text(snapshot.error);
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget earthContent(String id, DateTime time, String serviceVersion,
          String url, Resource resource) =>
      SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('\nID: $id'),
              Text('\nTime : $time'),
              Text('\nUrl : $serviceVersion'),
              Text('\nUrl : $url'),
              Image.network(url),
              Text('\nPlanet : ${resource.planet}'),
              Text('\nDataset : ${resource.dataset}'),
            ],
          ),
        ),
      );
}
