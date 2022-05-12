import 'package:flutter/cupertino.dart';

class ListProvider extends ChangeNotifier {
  List<Model> _newList = [];
  List<Model> get newList => _newList;

  ///? initialize list
  List<Model> listOfData = List<Model>.generate(10000, (index) {
    final x = List<Model>.generate(1000,
        (i) => Model(name: '$index Sub Tile $i', data: null, values: null));
    return Model(name: 'Tile $index', values: null, data: x);
  });

  ///? add list
  void addList(
      {required int index,
      required List<Model> middleList,
      required Model single}) {
    if (newList.isNotEmpty) {
      if (newList == middleList) {
        _newList = [];
        listOfData = listOfData.where((e) => e.data != null).toList();
      } else {
        _newList = middleList;
        listOfData = listOfData.where((e) => e.data != null).toList();
        final i = listOfData.indexOf(single);
        final _firstList = listOfData.take(i + 1);
        final _lastList = listOfData.skip(i + 1);
        listOfData = [..._firstList, ..._newList, ..._lastList];
      }
    } else {
      _newList = middleList;
      final _firstList = listOfData.take(index + 1);
      final _lastList = listOfData.skip(index + 1);
      listOfData = [..._firstList, ...middleList, ..._lastList];
    }
    notifyListeners();
  }
}

///? model
class Model {
  final String? name;
  final List<String>? values;
  final List<Model>? data;
  Model({required this.data, required this.name, required this.values});
}
