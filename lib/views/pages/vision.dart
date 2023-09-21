import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ma_boutique/model/article.dart';

class Vision extends StatelessWidget{
  Article article;
  Vision({required this.article});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(article.name),
      ),
      body: Center(
        child: Card(
          elevation: 7,

          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(10,)),
              Text(article.name, style: TextStyle(fontSize: 18),),
              Padding(padding: EdgeInsets.all(12)),
             (article.image != null)
             ?Container(
                height: size.height/2,
                child: Image.file(File(article.image!)),
              )
              :Container(),
              Padding(padding: EdgeInsets.all(12)),
              Text("Prix: ${article.price} XOF", style: TextStyle(fontSize: 18, color: Colors.red),),
              Text("Boutique: ${article.shop}", style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}