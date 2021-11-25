import 'package:flutter/material.dart';

class InputDialog extends StatelessWidget {
  InputDialog({Key? key}) : super(key: key);

  final title = TextEditingController();
  final description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Title'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
              controller: title,
              decoration: const InputDecoration(hintText: 'Title')),
          TextField(
              controller: description,
              decoration: const InputDecoration(hintText: 'Description'))
        ],
      ),
    );
  }
}
