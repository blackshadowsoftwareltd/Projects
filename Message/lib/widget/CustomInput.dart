import 'package:Massage/services/constants.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final String hintText;

  final Function(String) onChanged;
  final Function(String) onSubmit;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final bool eyeVisible;
  final TextInputType keyboardType;

  CustomInput(
      {this.textInputAction,
      this.eyeVisible,
      this.focusNode,
      this.onSubmit,
      this.onChanged,
      this.hintText,
      this.keyboardType});

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool _obScureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.green[200], borderRadius: BorderRadius.circular(10)),
        child: TextField(
            focusNode: widget.focusNode,
            onChanged: widget.onChanged,
            onSubmitted: widget.onSubmit,
            textInputAction: widget.textInputAction,
            obscureText: widget.eyeVisible ? _obScureText : !_obScureText,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                suffixIcon: widget.eyeVisible
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            _obScureText = !_obScureText;
                          });
                        },
                        child: _obScureText
                            ? Icon(Icons.visibility_outlined)
                            : Icon(Icons.visibility_off_outlined),
                      )
                    : null),
            style: Constants.ligntHeading,
            textAlign: TextAlign.start));
  }
}
