import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ma_boutique/model/article.dart';
import 'package:ma_boutique/service/DatabaseClient.dart';
import 'package:ma_boutique/views/pages/ajoutTextField.dart';
import 'package:ma_boutique/views/widget/customAppbar.dart';

class AjoutArticle extends StatefulWidget{
  final int CategId;
  AjoutArticle({required this.CategId});

  @override
 Ajout createState() => Ajout();
}
class Ajout extends State<AjoutArticle>{
  late TextEditingController nameController;
  late TextEditingController priceController;
  late TextEditingController shopController;
  late TextEditingController observationController;
  String? imagePath;
  @override
  void initState() {
    nameController = TextEditingController();
    priceController = TextEditingController();
    shopController = TextEditingController();
    observationController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    shopController.dispose();
    observationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
  appBar: CustomAppBar(
      voidCallback: addArticle,
      titleButtom: "Valider",
      titleString: "Ajouter un article"
  ), body: SingleChildScrollView(
     padding: EdgeInsets.all(16),
     child: Column(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       mainAxisSize: MainAxisSize.max,
       children: [
         Text("Nouveau article", style: TextStyle(
           fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red
         ),), 
         Card(
           elevation: 7,
           child: Column(
             mainAxisSize: MainAxisSize.max,
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               (imagePath == null)
               ? const Icon(Icons.camera, size: 128,)
                   : Image.file(File(imagePath!)),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 mainAxisSize: MainAxisSize.max,
                 children: [
                   IconButton(onPressed:(() => takePicture(ImageSource.camera)), icon: Icon(Icons.camera_alt)),
                   IconButton(onPressed:(() => takePicture(ImageSource.gallery)), icon: Icon(Icons.photo_library_outlined)),
                 ],
               ),
               AjoutTextField(hint: "Nom de l'article", controller: nameController, ),
               AjoutTextField(hint: "Prix", controller: priceController,type: TextInputType.number, ),
               AjoutTextField(hint: "Magasin", controller: shopController, ),
              
             ],
           ) ,
         )
       ],
     ),
   ),
   );
  }
  addArticle(){
    FocusScope.of(context).requestFocus(FocusNode());
    if(nameController.text.isEmpty) return;
    Map<String, dynamic>map = {"categories": widget.CategId};
    map['name'] = nameController.text;
    if(shopController.text.isNotEmpty) map["shop"] = shopController.text;
    double price = double.tryParse(priceController.text) ?? 0.0;
    map['price'] = price;
    if(imagePath != null) map["image"] = imagePath!;
    Article article = Article.fromMap(map);
    DatabaseClient().upsert(article).then((succes) => Navigator.pop(context));
  }
  takePicture(ImageSource source) async{
    XFile? xFile = await ImagePicker().pickImage(source: source);
    if(xFile == null) return;
    setState(() {
      imagePath = xFile!.path;
    });
  }
}