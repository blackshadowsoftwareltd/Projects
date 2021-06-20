import 'package:flutter/material.dart';
import 'package:reqres/putRequest/UpdateModel.dart';
import 'package:reqres/putRequest/UpdateService.dart';

class UpDatePage extends StatefulWidget {
  @override
  _UpDatePageState createState() => _UpDatePageState();
}

class _UpDatePageState extends State<UpDatePage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController jobController = TextEditingController();

  UpdateModel updateModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                if (updateModel != null)
                  Text(
                      'Name: ${updateModel.name} \nJob Title: ${updateModel.job} \nCreated At: ${updateModel.updatedAt.toIso8601String()}'),
                  OutlinedButton(
                      child: Text('Update a Request'),
                      onPressed: () async {
                        final UpdateModel req = await getUpdate(
                            nameController.text, jobController.text);
                        nameController.clear();
                        jobController.clear();
                        setState(() => updateModel = req);
                      })
              ])),
    );
  }
}
