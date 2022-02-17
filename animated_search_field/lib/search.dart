import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({Key? key}) : super(key: key);

  @override
  _CustomSearchFieldState createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  late bool _isSearching;
  late String _searchText;
  late TextEditingController _searchTextEditingController;
  late double _width;

  @override
  void initState() {
    super.initState();
    _isSearching = false;
    _searchText = '';
    _searchTextEditingController = TextEditingController();
    _width = 300;

    _searchTextEditingController.addListener(() {
      debugPrint(_searchText);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
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
                            color: Theme.of(context).textTheme.subtitle1!.color,
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
                          setState(() {});
                        }))),

            /// input panel
            AnimatedContainer(
                curve: Curves.easeInOutCirc,
                duration: const Duration(milliseconds: 500),
                width: _isSearching ? _width * .8 : 0,
                height: _isSearching ? 45 : 25,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.05),
                    border: Border.all(
                        color: Colors.black.withOpacity(.2), width: .5),
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                    controller: _searchTextEditingController,
                    cursorColor: Colors.lightBlue,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w300),
                    decoration: const InputDecoration(
                        hintText: 'Search here...',
                        hintStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w300),
                        disabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                    onChanged: (text) => _searchText = text)),

            ///  search button
            AnimatedContainer(
                curve: Curves.easeInOutCirc,
                duration: const Duration(milliseconds: 500),
                width: _isSearching ? 0 : 30,
                height: _isSearching ? 0 : 30,
                child: FittedBox(
                    child: KCustomButton(
                        widget: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Icon(Icons.search,
                                size: 30, color: Colors.black.withOpacity(.7))),
                        onPressed: () => setState(() => _isSearching = true))))
          ]),
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
