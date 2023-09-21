import 'package:flutter/material.dart';
import 'package:ma_boutique/views/pages/connexion.dart';
import 'package:ma_boutique/views/pages/second.dart';


class Mesbuttons extends StatelessWidget{

  bool verif ;
  Mesbuttons({required this.verif, });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style:  ElevatedButton.styleFrom(
            backgroundColor: verif ? Colors.indigo : Colors.purple,
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 60)
        ),
        onPressed: (){
          if(verif){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Second()));
          }else{
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Connexion()));
          }

        },
        child: Text(verif ? "Commencer" : "Connexion",
          style: TextStyle(
              color: verif ? Colors.white70 : Colors.blue,
              fontWeight: FontWeight.bold, fontSize: 25
          ) ,)
    );
  }
}
