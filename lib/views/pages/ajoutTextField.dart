import 'package:flutter/material.dart';

class AjoutTextField extends StatelessWidget{
  String hint;
  TextEditingController controller;
  TextInputType type;
  AjoutTextField({required this.hint, required this.controller, this.type =TextInputType.text});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        hintText: hint
      ),
    );
  }
}