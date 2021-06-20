import 'package:flutter/material.dart';
import 'package:reqres/postRequest/PostReqModel.dart';
import 'package:reqres/postRequest/PostReqServices.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController jobController = TextEditingController();

  PostRequestModel requestModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Post Page')),
        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                      controller: nameController,
                      decoration: InputDecoration(hintText: 'Name')),
                  TextField(
                      controller: jobController,
                      decoration: InputDecoration(hintText: 'Job')),
                  if (requestModel != null)
                    Text(
                        'Id: ${requestModel.id} \nName: ${requestModel.name} \nJob Title: ${requestModel.job} \nCreated At: ${requestModel.createdAt.toIso8601String()}'),
                  OutlinedButton(
                      child: Text('Post a Request'),
                      onPressed: () async {
                        final PostRequestModel req = await getPostReq(
                            nameController.text, jobController.text);
                        nameController.clear();
                        jobController.clear();
                        setState(() => requestModel = req);
                      })
                ])));
  }
}
