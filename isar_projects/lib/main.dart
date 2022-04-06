import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:isar_projects/database/category/category.dart';
import 'package:isar_projects/database/routine/routine.dart';
import 'package:isar_projects/provider/state_provider.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationSupportDirectory();
  final isar = await Isar.open(
      schemas: [RoutineSchema, CategorySchema], directory: dir.path);

  runApp(const ProviderScope(
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Home())));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Isar DB'),
        actions: [
          IconButton(
              onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) =>
                        const AddCategoryDialog(),
                  ),
              icon: const Icon(Icons.add))
        ],
      ),
    );
  }
}

class AddCategoryDialog extends ConsumerWidget {
  const AddCategoryDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
        title: const Text('Add Category'),
        content: Column(mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * .65,
                  child: DropdownButton(
                      focusColor: Colors.white,
                      isExpanded: true,
                      value: ref.watch(dropdownValue.state).state,
                      items: ref
                          .read(category.state)
                          .state
                          .map<DropdownMenuItem<String>>(
                              (String e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e.toUpperCase()),
                                  ))
                          .toList(),
                      onChanged: (value) {
                        print(value);
                        ref.read(dropdownValue.state).state = value.toString();
                      })),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(hintText: 'Title'),
              ),
              // Row(
              //   children: [
              // const Text('Start time'),

              // IconButton(
              //     onPressed: () {},
              //     icon: const Icon(Icons.calendar_month_outlined))
              //   ],
              // )
              SizedBox(
                  width: MediaQuery.of(context).size.width * .65,
                  child: DropdownButton(
                      focusColor: Colors.white,
                      isExpanded: true,
                      value: ref.watch(selectedDay.state).state,
                      items: ref
                          .read(days.state)
                          .state
                          .map<DropdownMenuItem<String>>(
                              (String e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e.toUpperCase()),
                                  ))
                          .toList(),
                      onChanged: (value) {
                        print(value);
                        ref.read(selectedDay.state).state = value.toString();
                      })),
            ]),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'))
        ]);
  }
}
