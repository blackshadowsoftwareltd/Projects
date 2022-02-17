import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool _isSearching;
  late String _searchText;
  late TextEditingController _searchTextEditingController;

  @override
  void initState() {
    super.initState();
    _isSearching = false;
    _searchText = '';
    _searchTextEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: SizedBox(
        width: 300,
        height: 100,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              AnimatedContainer(
                  curve: Curves.easeInOutCirc,
                  width: _isSearching ? 0 : 35,
                  height: _isSearching ? 0 : 35,
                  duration: const Duration(milliseconds: 500),
                  child: const FittedBox(child: KBackButton(padding: 0))),

              /// text
              AnimatedContainer(
                  curve: Curves.easeInOutCirc,
                  width: _isSearching ? 0 : 120,
                  height: _isSearching ? 30 : 30,
                  duration: const Duration(milliseconds: 500),
                  child: FittedBox(
                      child: Text('Title',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).textTheme.subtitle1!.color,
                              fontSize: 16)))),

              /// close search
              AnimatedContainer(
                curve: Curves.easeInOutCirc,
                width: _isSearching ? 35 : 0,
                height: _isSearching ? 35 : 0,
                duration: const Duration(milliseconds: 500),
                child: FittedBox(
                  child: KCustomButton(
                    widget: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Icon(
                        Icons.close,
                        color: Colors.black.withOpacity(.7),
                      ),
                    ),
                    onPressed: () {
                      _isSearching = false;
                      _searchTextEditingController.clear();
                      _searchText = '';
                    },
                  ),
                ),
              ),
            ]),
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() => _isSearching = !_isSearching)),
    );
  }
}

class KCustomButton extends StatelessWidget {
  final Widget widget;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final double? radius;

  const KCustomButton(
      {Key? key,
      required this.widget,
      required this.onPressed,
      this.radius,
      this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 50),
        child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(radius ?? 50),
            child: InkWell(
                splashColor: Theme.of(context).primaryColor.withOpacity(.2),
                highlightColor: Theme.of(context).primaryColor.withOpacity(.05),
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    child: widget),
                onTap: onPressed,
                onLongPress: onLongPress)));
  }
}

class KBackButton extends StatelessWidget {
  final Widget? previousScreen;
  final Color? iconColor;
  final double? padding;
  const KBackButton(
      {Key? key, this.previousScreen, this.iconColor, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(padding ?? 5),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(50),
                child: InkWell(
                    splashColor: Theme.of(context).primaryColor.withOpacity(.2),
                    highlightColor:
                        Theme.of(context).primaryColor.withOpacity(.05),
                    onTap: () async {
                      previousScreen == null
                          ? Navigator.pop(context)
                          : Navigator.pushReplacement(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => previousScreen!));
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: SizedBox(
                            width: 30,
                            height: 30,
                            child: Icon(Icons.arrow_back_ios_new,
                                color:
                                    iconColor ?? Colors.black.withOpacity(.7),
                                size: 25)))))));
  }
}
