import 'package:flutter/material.dart';

class AddDialogue extends StatelessWidget{
  final TextEditingController controller;
  VoidCallback onCancel;
  VoidCallback onAdd;
  AddDialogue({required this.controller, required this.onCancel, required this.onAdd});
  @override
  Widget build(BuildContext context) {
   return AlertDialog(
     title: Text("Ajouter une Categorie"),
     content: TextField(
       controller: controller,
       decoration: InputDecoration(
         hintText: "Entrez une Categorie"
       ),
     ),
     actions: [
       TextButton(onPressed: onAdd, child: Text("Valider")),
       TextButton(onPressed: onCancel, child: Text("Annuler")),
     ],
   );
  }
}