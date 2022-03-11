import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

final keys = List<GlobalKey>.generate(5, (index) => GlobalKey());

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
        print('start $_index');
      },
      onPanUpdate: (details) {
        final _dx = details.globalPosition.dx;
        final _dy = details.globalPosition.dy;
        final _start = offsetBoxes!.where((e) {
          return _dx >= e.xf! && _dx <= e.xe! && _dy >= e.yf! && _dy <= e.ye!;
        }).toList();
        print('.................... ${_start.length}');
        final _index = offsetBoxes!.indexOf(_start.first);
        print('Last $_index');
      },
      child: Container(
          color: Colors.green,
          height: 300,
          width: 500,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: keys.length,
            itemBuilder: (context, index) {
              Future.delayed(const Duration(seconds: 2), () {
                print('xx');
                final RenderBox renderBox =
                    keys[index].currentContext?.findRenderObject() as RenderBox;
                final Offset offset = renderBox.localToGlobal(Offset.zero);
                final Size size =
                    renderBox.size; // or _widgetKey.currentContext?.size
                // print('xf ${offset.dx} xe ${offset.dx + size.width}');
                if (offsetBoxes?[index].xf == null) {
                  final _data = OffsetDetails(
                      xf: offset.dx,
                      xe: offset.dx + size.width,
                      yf: offset.dy,
                      ye: offset.dy + size.height);
                  offsetBoxes?[index] = _data;
                } else {}
              });

              return Button(key: keys[index], index: index);
            },
          )),
    )));
  }
}

class Button extends StatelessWidget {
  const Button({
    required this.key,
    required this.index,
  }) : super(key: key);
  final GlobalKey key;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.orange,
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

List<OffsetDetails>? offsetBoxes =
    List.filled(5, OffsetDetails(xf: null, xe: null, yf: null, ye: null));

class OffsetDetails {
  final double? xf;
  final double? xe;
  final double? yf;
  final double? ye;

  OffsetDetails(
      {required this.xf, required this.xe, required this.yf, required this.ye});
}
