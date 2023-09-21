import 'package:flutter/material.dart';
import 'package:ma_boutique/model/item_categori.dart';
import 'package:ma_boutique/service/DatabaseClient.dart';
import 'package:ma_boutique/views/Tiles/item_cateTiel.dart';
import 'package:ma_boutique/views/pages/categorieListView.dart';
import 'package:ma_boutique/views/widget/ajoutDiallog.dart';
import 'package:ma_boutique/views/widget/customAppbar.dart';

class Second extends StatefulWidget{

 @override
 Seconder createState() => Seconder();
}
class Seconder extends State<Second>{
  List<ItemCategories> items = [];
  @override
  void initState() {
   getallItemCategorie();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          voidCallback: addItemCategorie,
          titleButtom: "Ajouter",
          titleString:"Liste des categories"
      ),
      body: ListView.separated(
          itemBuilder: ((context, index){
            final item = items[index];
            return ItemCategoriTile(
                itemCategories: item,
                onDelete: onDelete,
                onPressed: onPressedItemcat
            );
          }),
          separatorBuilder: ((context, index) => Divider()),
          itemCount: items.length
      ),
    );
  }
  getallItemCategorie() async{
    final fromdb = await DatabaseClient().allItemCatego();
    setState(() {
      items = fromdb;
    });
  }
  onPressedItemcat(ItemCategories itemCategories){
  final next = CategoriList(itemCategories: itemCategories);
  MaterialPageRoute route = MaterialPageRoute(builder: (context) => next);
  Navigator.of(context).push(route);
  }
  onDelete(ItemCategories itemCategories){
   DatabaseClient().removeItem(itemCategories).then((value) => getallItemCategorie());
  }
  addItemCategorie() async {
   await showDialog(context: context, builder: (context){
     final controller = TextEditingController();
     return AddDialogue(
         controller: controller,
         onCancel: handlCloseDialog,
         onAdd: ((){
           handlCloseDialog();
           if(controller.text.isEmpty) return ;
           DatabaseClient().addItemCatego(controller.text).then((succes) => getallItemCategorie());
         })
     );
   });
  }

  handlCloseDialog(){
    Navigator.pop(context);
    FocusScope.of(context).requestFocus(FocusNode());
  }
}