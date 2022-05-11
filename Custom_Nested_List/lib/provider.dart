import 'package:flutter/cupertino.dart';

class ListProvider extends ChangeNotifier {
  final listOfData = List<Model>.generate(100, (i) {
    List<int> x = List.generate(100, (x) => x);
    x.shuffle();

    return Model(index: i, values: x);
  });

  Model? _selectedModel = null;
  Model? get selectedModel => _selectedModel;

  set selectedModel(Model? data) {
    if (data == selectedModel) {
      _selectedModel = null;
    } else {
      _selectedModel = data;
    }
    notifyListeners();
  }
}

class Model {
  final int index;
  final List<int> values;
  Model({required this.index, required this.values});
}
