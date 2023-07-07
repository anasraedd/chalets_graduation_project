import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextInputType keyboardType;
  final BuildContext context;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final bool autofocus;

  CustomTextField(
      {required this.hint,
      required this.keyboardType,
      required this.context,
      required this.controller,
      this.focusNode,
      this.autofocus = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      controller: controller,
      focusNode: focusNode,
      autofocus: autofocus,
      decoration: InputDecoration(
        hintText: hint,
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.3)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1.3)),
      ),
    );
  }
}
