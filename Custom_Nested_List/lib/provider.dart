import 'package:flutter/cupertino.dart';

class ListProvider extends ChangeNotifier {
  final listOfData = List<Model>.generate(
      100, (i) => Model(index: i, values: List.generate(100, (x) => x)));

  Model? _selectedModel = null;
  Model? get selectedModel => _selectedModel;

  set selectedModel(Model? data) {
    _selectedModel = data;
    notifyListeners();
  }
}

class Model {
  final int index;
  final List<int> values;
  Model({required this.index, required this.values});
}
