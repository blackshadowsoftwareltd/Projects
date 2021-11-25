import 'package:flutter/material.dart';
import 'package:sqfl/database/database.dart';
import 'package:sqfl/model/note.dart';

class DatabaseList extends StatefulWidget {
  const DatabaseList({Key? key}) : super(key: key);

  @override
  State<DatabaseList> createState() => _DatabaseListState();
}

class _DatabaseListState extends State<DatabaseList> {
  bool isLoading = false;
  late List<Note> notes;
  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: notes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.green),
          );
        });
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);
    notes = await NotesDatabase.instance.readAllNotes();
    setState(() => isLoading = false);
  }
}
