import 'dart:io';
import 'package:ma_boutique/model/article.dart';
import 'package:ma_boutique/model/item_categori.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseClient{
  // pour acceder à la base de donnée
  Database? _database;
  Future<Database> get database async{
   if(_database != null) return _database!;
   return creteDataBase();
  }
  Future<Database> creteDataBase() async {
   Directory directory = await getApplicationDocumentsDirectory();
   final path = join(directory.path, "database.db");
   return await openDatabase(path, version: 1, onCreate:Oncreate );
}

Oncreate(Database database, int version) async{
    // Table1
  await database.execute('''
     CREATE TABLE categories (
     id INTEGER PRIMARY KEY,
     name TEXT NOT NULL
     )
   
  ''');
  // Table2
  await database.execute('''
  CREATE TABLE article(
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  price REAL,
  shop TEXT,
  image TEXT,
  categories INTEGER
  )
  ''');
}

// obtenir les données
Future<List<ItemCategories>> allItemCatego() async{
    Database db = await database;
    const query = 'SELECT * FROM categories';
    List<Map<String,dynamic>> mapList = await db.rawQuery(query);
    return mapList.map((map) => ItemCategories.fromMap(map)).toList();
}
Future<List<Article>>articleFromid(int id) async{
    Database db = await database;
    List<Map<String, dynamic>> mapList= await db.query(
        'article', where: 'categories = ?', whereArgs: [id]
    );
    return mapList.map((map) => Article.fromMap(map)).toList();
}

// ajout des données

Future<bool> addItemCatego( String text)async{
   Database db = await database;
   await db.insert('categories', {'name': text});
   return true;

}
Future<bool> upsert(Article article) async{
    Database db = await database;
   (article.id == null)
      ? article.id = await db.insert("article", article.toMap())
      : article.id = await db.update("article", article.toMap(),  where: 'id = ?', whereArgs: [article.id],);
    return true;
}
// supprimer les donnees
Future<bool> removeItem(ItemCategories itemCategories) async{
    Database db = await database;
    await db.delete("categories", where: 'id=?', whereArgs: [itemCategories.id]);
    await db.delete('article', where: 'categories=?', whereArgs: [itemCategories.id]);
    return true;
}



}