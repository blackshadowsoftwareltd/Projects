import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

final keys = List<GlobalKey>.generate(25, (index) => GlobalKey());
int? startIndex, endIndex, selectedIndex;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: GestureDetector(
      onPanStart: (details) {
        final _dx = details.globalPosition.dx;
        final _dy = details.globalPosition.dy;
        final _start = offsetBoxes!.where((e) {
          return _dx > e.xf! && _dx < e.xe! && _dy > e.yf! && _dy < e.ye!;
        }).toList();
        final _index = offsetBoxes!.indexOf(_start.first);

        startIndex = _index;
        endIndex = _index;
        selectedIndex = null;
        print('start $startIndex end $endIndex');
      },
      onPanUpdate: (details) {
        late int _index;
        final _dx = details.globalPosition.dx;
        final _dy = details.globalPosition.dy;
        final _start = offsetBoxes!.where((e) {
          return _dx >= e.xf! && _dx <= e.xe! && _dy >= e.yf! && _dy <= e.ye!;
        }).toList();
        try {
          if (_start.isNotEmpty) {
            _index = offsetBoxes!.indexOf(_start.first);

            endIndex = _index;
            selectedIndex = null;
            print('start $startIndex end $endIndex');
          }
        } catch (e) {
          print(e.toString());
        }
        setState(() {});
      },
      child: Container(
          color: Colors.green,
          child: GridView.builder(
            itemCount: keys.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5),
            itemBuilder: (context, index) {
              Future.delayed(const Duration(seconds: 1), () {
                final RenderBox renderBox =
                    keys[index].currentContext?.findRenderObject() as RenderBox;
                final Offset offset = renderBox.localToGlobal(Offset.zero);
                final Size size = renderBox.size;

                if (offsetBoxes?[index].xf == null) {
                  final _data = OffsetDetails(
                      xf: offset.dx,
                      xe: offset.dx + size.width,
                      yf: offset.dy,
                      ye: offset.dy + size.height);
                  offsetBoxes?[index] = _data;
                } else {}
              });

              return InkWell(
                onTap: () {
                  selectedIndex = index;
                  setState(() {});
                },
                child: Button(
                  key: keys[index],
                  index: index,
                  isSelected: select(index),
                ),
              );
            },
          )),
    )));
  }

  bool select(index) {
    if (selectedIndex == null) {
      return startIndex != null && endIndex != null
          ? isSelected(index: index, start: startIndex!, end: endIndex!)
          : false;
    }
    return index == selectedIndex;
  }

  bool isSelected({required int index, required int start, required int end}) {
    if (start <= end) {
      if (index >= start && index <= end) {
        return true;
      }
    } else {
      if (index <= start && index >= end) {
        return true;
      }
    }
    return false;
  }
}

class Button extends StatelessWidget {
  const Button({
    required this.key,
    required this.index,
    required this.isSelected,
  }) : super(key: key);
  final GlobalKey key;
  final int index;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.orange,
          border: Border.all(width: 2, color: Colors.black)),
    );
  }
}

// class XButton extends StatelessWidget {
//   const XButton({
//     required this.key,
//     required this.index,
//   }) : super(key: key);
//   final GlobalKey key;
//   final int index;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 100,
//         width: 80,
//         color: Colors.blue,
//         child: Button(key: key, index: index));
//   }
// }

// class Button extends StatelessWidget {
//   const Button({
//     required this.key,
//     required this.index,
//   }) : super(key: key);
//   final GlobalKey key;
//   final int index;

//   @override
//   Widget build(BuildContext context) {
//     print(key);
//     Future.delayed(const Duration(seconds: 1));
//     final RenderBox renderBox =
//         key.currentContext!.findRenderObject() as RenderBox;
//     final Size size = renderBox.size;
//     final Offset offset = renderBox.localToGlobal(Offset.zero);
//     return GestureDetector(
//       onTap: () {
//         print('\npressed');
//         final RenderBox renderBox =
//             key.currentContext?.findRenderObject() as RenderBox;

//         final Size size = renderBox.size; // or _widgetKey.currentContext?.size

//         // print('Size: ${size.width}, ${size.height}');

//         final Offset offset = renderBox.localToGlobal(Offset.zero);

//         // print('Offset: ${offset.dx}, ${offset.dy}');

//         // print(
//         //     'Position: ${(offset.dx + size.width) / 2}, ${(offset.dy + size.height) / 2}');
//         print('xf ${offset.dx} xe ${offset.dx + size.width}');
//       },
//       child: Container(
//         height: 100,
//         width: 80,
//         margin: const EdgeInsets.all(5),
//         color: Colors.orange,
//       ),
//     );
//   }
// }

List<OffsetDetails>? offsetBoxes = List.filled(
    keys.length, OffsetDetails(xf: null, xe: null, yf: null, ye: null));

class OffsetDetails {
  final double? xf;
  final double? xe;
  final double? yf;
  final double? ye;

  OffsetDetails(
      {required this.xf, required this.xe, required this.yf, required this.ye});
}
