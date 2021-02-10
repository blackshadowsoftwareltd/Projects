import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPresse;
  final Function(String) mailValidator;
  final bool outLineButton;
  final bool isLoading;

  CustomButton(
      {this.text,
      this.onPresse,
      this.outLineButton,
      this.isLoading,
      this.mailValidator});

  @override
  Widget build(BuildContext context) {
    bool _outLineButtons = outLineButton ?? false;
    bool _isLoad = isLoading ?? false;
    return GestureDetector(
        onTap: () {
          onPresse();
        },
        child: Container(
            // alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: _outLineButtons ? Colors.transparent : Colors.green[400],
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Stack(children: [
              Visibility(
                  visible: _isLoad ? false : true,
                  child: Center(
                      child: Text(text ?? 'text',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              color: _outLineButtons
                                  ? Colors.grey[900]
                                  : Colors.white,
                              fontWeight: FontWeight.w300)))),
              Visibility(
                  visible: _isLoad,
                  child: Center(
                      child: SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator())))
            ])));
  }
}
