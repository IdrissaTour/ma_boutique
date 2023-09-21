import 'package:flutter/material.dart';
import 'package:ma_boutique/model/item_categori.dart';


class ItemCategoriTile extends StatelessWidget{
  Function(ItemCategories)onPressed;
  Function(ItemCategories)onDelete;
 ItemCategories itemCategories;

 ItemCategoriTile({required this.itemCategories, required this.onDelete, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(itemCategories.name),
      onTap: (() => onPressed(itemCategories)),
      trailing: IconButton(
        onPressed: (() => onDelete(itemCategories)),
        icon: Icon(Icons.delete),
      ),
    );
  }
}