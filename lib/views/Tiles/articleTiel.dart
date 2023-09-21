import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ma_boutique/model/article.dart';
import 'package:ma_boutique/views/pages/vision.dart';

class ArticleTile extends StatelessWidget{
  Article article;
  ArticleTile({required this.article});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
   return
     InkWell(
     child: Column(
       mainAxisSize: MainAxisSize.max,
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(article.name, style: TextStyle(fontSize: 25),),
         if(article.image != null) Container(
           height: size.height/7,
           padding: EdgeInsets.all(5),
           child: Image.file(File(article.image!)),
         ),
         Text("Prix : ${article.price} XOF"),
         Text("Magasin : ${article.shop} "),
       ],
     ),
     onTap: (){
       final ok = MaterialPageRoute(builder: (context) => Vision(article: article));
       Navigator.push(context, ok);
     },
   );
  }
}