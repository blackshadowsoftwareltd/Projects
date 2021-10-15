import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'adapters/todo_adapter.dart';

class AddToDoScreen extends StatefulWidget {
  final Function(String title, String description) onPressed;
  final Todo? todo;
  AddToDoScreen({Key? key, required this.onPressed, this.todo})
      : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  _AddToDoScreenState createState() => _AddToDoScreenState();
}

class _AddToDoScreenState extends State<AddToDoScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.todo != null) {
      final products = widget.todo;

      titleController.text = products!.title;
      descriptionController.text = products.description;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Add Todo')),
        body: Form(
            key: widget.formKey,
            child: ListView(children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(hintText: 'Add Title'),
                    // onChanged: (value) => setState(() => title = value)
                  )),

              ///
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: descriptionController,
                    decoration:
                        const InputDecoration(hintText: 'Add Description'),
                    // onChanged: (value) =>
                    //     setState(() => description = value)
                  )),

              ///
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: submitData, child: const Text('Submit')))
            ])));
  }

  submitData() async {
    if (widget.formKey.currentState!.validate()) {
      widget.onPressed(titleController.text, descriptionController.text);

      /// (add);
      // Box<Todo> todoBox = Hive.box<Todo>('todos');
      // todoBox.add(
      //     Todo(title: title.toString(), description: description.toString()));
      Navigator.pop(context);
    }
  }
}
