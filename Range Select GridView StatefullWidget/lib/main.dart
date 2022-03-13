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
            child: SizedBox(
      width: 400,
      height: 400,
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

            return GestureDetector(
              onTap: () {
                if (selectedIndex == index) {
                  selectedIndex = null;
                } else if (selectedIndex == null) {
                  selectedIndex = index;
                  startIndex = index;
                  endIndex = null;
                } else if (startIndex != null && endIndex == null) {
                  selectedIndex = null;
                  endIndex = index;
                  selectedIndex = null;
                } else if (startIndex == index ||
                    endIndex == index ||
                    selectedIndex == index) {
                  startIndex = null;
                  endIndex = null;
                  selectedIndex = null;
                }

                setState(() {});
              },
              child: Button(
                key: keys[index],
                index: index,
                isSelected: select(index),
              ),
            );
          },
        ),
      ),
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
    return AnimatedContainer(
      margin: isSelected ? const EdgeInsets.all(1) : const EdgeInsets.all(3),
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
          color: isSelected ? Colors.lightBlueAccent.shade400 : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 1,
              color: isSelected ? Colors.transparent : Colors.black54)),
      child: Center(
        child: Text(
          '${index + 1}',
          style: TextStyle(
              fontSize: isSelected ? 20 : 18,
              color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}

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
