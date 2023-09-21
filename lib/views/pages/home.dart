

import 'package:flutter/material.dart';
import 'package:ma_boutique/views/pages/elevetedBUtton.dart';

class Home extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
   // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Ma boutique"),
      ),
      body: Center(
        child: Card(
          color: Colors.white70,
          elevation: 7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(padding: EdgeInsets.all(12),
              child: Text("Bienvenu chez Ma boutique",
                style: TextStyle(
                  color: Colors.deepPurple, fontSize: 25, fontWeight: FontWeight.bold
                ) ,),
              ),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                 shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/ma.jpeg"),radius:75 ,
                ),
              ),
             Mesbuttons(verif: true, ),
             Mesbuttons(verif: false,)
            ],
          ),
        ),
      ),
    );
  }

 }
