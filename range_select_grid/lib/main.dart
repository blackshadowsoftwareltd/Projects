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
        onPanUpdate: (details) {
          print(
              'Offset: ${details.globalPosition.dx}, ${details.globalPosition.dy}');
        },
        child: Container(
          color: Colors.green,
          height: 300,
          width: 500,
          child: Row(children: [...keys.map((e) => Button(e)).toList()]),
        ),
      )),
    );
  }
}

class Button extends StatelessWidget {
  const Button(
    this.key,
  ) : super(key: key);
  final GlobalKey key;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('\npressed');
        final RenderBox renderBox =
            key.currentContext?.findRenderObject() as RenderBox;

        final Size size = renderBox.size; // or _widgetKey.currentContext?.size

        print('Size: ${size.width}, ${size.height}');

        final Offset offset = renderBox.localToGlobal(Offset.zero);

        print('Offset: ${offset.dx}, ${offset.dy}');

        print(
            'Position: ${(offset.dx + size.width) / 2}, ${(offset.dy + size.height) / 2}');
      },
      child: Container(
        height: 100,
        width: 80,
        margin: const EdgeInsets.all(5),
        color: Colors.orange,
      ),
    );
  }
}
