import 'dart:io';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Inscription extends StatefulWidget {
  @override
  _InscriptionState createState() => _InscriptionState();
  //_AuthentificateScreenState createState() => _AuthentificateScreenState();
}

class _InscriptionState extends State<Inscription> {
  var _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30),
          child: Form(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .stretch, //CrossAxisAlignment.stretch, nous permet de d'aligner notre bouton aux memes dimansions que les TextFormField
            children: <Widget>[
              Image.asset(
                'images/shop.png',
                height: 100.0,
                width: 100.0,
              ),
              SizedBox(height: 15.0),
              Center(
                child: Text(
                  'Creation du compte',
                  style: Theme.of(context).textTheme.title,
                  //GoogleFonts.poppins(color: Colors.blueGrey, fontSize: 20),
                ),
              ),

              //le SizeBox me permet de faire un espacement de 1Opx en bas du logo
              SizedBox(height: 35.0),
              //TextField me permet de creer un champ a remplir
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nom et Prenom',
                  //border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'adresse email',
                  //border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'mot de passe',
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.visibility,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  //border: OutlineInputBorder(),
                ),
                //obscureText: true,
              ),
              SizedBox(height: 10.0),
              TextFormField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Confirmer le mot de passe',
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.visibility,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  //border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: d_red,
                  shape: StadiumBorder(),
                  padding: EdgeInsets.all(
                      13), //padding permet de donner la forme arrondi a notre bouton commencer
                ),
                child: Text('S\'inscrire'),
                // Navigator.push permet de lier les deux pages grace au bouton COMMENCER
                onPressed: () {},
              ),
              OutlinedButton(
                  onPressed: () {}, child: Text('Avez-vous déja un compte ?')),
            ],
          )),
        ),
      ),
    );
  }
}
