import 'package:flutter/material.dart';
import 'package:ma_boutique/model/article.dart';
import 'package:ma_boutique/model/item_categori.dart';
import 'package:ma_boutique/service/DatabaseClient.dart';
import 'package:ma_boutique/views/Tiles/articleTiel.dart';
import 'package:ma_boutique/views/pages/ajoutArticle.dart';
import 'package:ma_boutique/views/widget/customAppbar.dart';

class CategoriList extends StatefulWidget{
  ItemCategories itemCategories;
  CategoriList({ required this.itemCategories});
  @override
  CategoriLt createState()=> CategoriLt();
}
class CategoriLt extends State<CategoriList>{
  List<Article> articles = [];
  @override
  void initState() {
   getArticle();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: CustomAppBar(
         voidCallback: addNewCatego,
         titleButtom: "+",
         titleString: widget.itemCategories.name
     ),
     body: GridView.builder(
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
         itemBuilder: ((context, index) => ArticleTile(article:articles[index])),
       itemCount: articles.length,
       
     ),
   );


  }
  getArticle(){
    DatabaseClient().articleFromid(widget.itemCategories.id).then((articles) {
      setState(() {
        this.articles = articles;
      });
    });
  }
  addNewCatego(){
    final next = AjoutArticle(CategId: widget.itemCategories.id);
    MaterialPageRoute route = MaterialPageRoute(builder: (context)=> next);
    Navigator.push(context, route);
  }

}