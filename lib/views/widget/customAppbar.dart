import 'package:flutter/material.dart';

class CustomAppBar extends AppBar{
  String titleString;
  String titleButtom;
  VoidCallback voidCallback;
  
  CustomAppBar({required this.voidCallback, required this.titleButtom, required this.titleString}): super(
    
    title: Text(titleString),
    actions: [
      TextButton(onPressed: voidCallback, child: Text(titleButtom,
        style:TextStyle(color: Colors.white70) ,))
    ]
  );
}