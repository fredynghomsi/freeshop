import 'package:flutter/material.dart';
import 'package:freeshop/services/Methods.dart';
//import '/services/BDconnexion.dart';
//import 'package:freeshop/services/authentification.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase/firestore.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

import '../main.dart';

class Inscription extends StatefulWidget {
  final Function basculation;
  Inscription({this.basculation});

  @override
  _InscriptionState createState() => _InscriptionState();
  //_AuthentificateScreenState createState() => _AuthentificateScreenState();
}

class _InscriptionState extends State<Inscription> {
  bool isLoading = false;
  final TextEditingController _nomComplet = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _mdp = TextEditingController();

  //Collection Utilisateur depuis firestore

  String nomComplet = '';
  String email = '';
  String mdp = '';
  String confirmMdp = '';

  // Ici nous creons la clé de notre formulaire

  final _formKey = GlobalKey<FormState>();
  var _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        //debut de notre APPBAR
        //title: Text('Page social'), //j'utlise le title au cas ou je souhaite mettre un titre a ma page
        elevation:
            0, //Elevation 0 permet de mettre la zone de l'appBar ou encore la zone destiné au titre de la page a 0
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {}, //  => widget.onChangedStep(0, null),
          /* {
            Navigator.pop(context);
          },*/
        ),
        /* title: Text(showSignIn ? 'Creer un compte' : 'Se connecter'),
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.person),
              label: Text(showSignIn ? 'Creer un compte' : 'Se connecter'),  
              onPressed: ()  {}  //=> toggleView(), 
            ),  
          ]
          */
      ),
      body: isLoading
          ? Center(
              child: Container(
                height: size.height / 20,
                width: size.height / 20,
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30),
                child: Form(
                    key: _formKey,
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
                            style: Theme.of(context).textTheme.headline6,
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
                          //Ici nous verifions que le champ correspondant au nomcomplet ne soit pas vide
                          validator: (val) =>
                              val.isEmpty ? 'Veillez entrer votre nom' : null,
                          onChanged: (val) => nomComplet = val,
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          //onChanged: (value) => setState(() => _email = value),
                          //controller: emailController,
                          validator: (val) => val.isEmpty
                              ? 'Veillez entrer votre adresse email'
                              : null,
                          onChanged: (val) => email = val,
                          decoration: InputDecoration(
                            labelText: 'adresse email',
                            //border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          //controller: passwordController,
                          validator: (val) => val.length < 6
                              ? 'Le mot de passe doit etre d\'au moins 6 caractes'
                              : null,
                          onChanged: (val) => mdp = val,
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
                          onChanged: (val) => confirmMdp = val,
                          validator: (val) => confirmMdp != mdp
                              ? 'Le mots de passe ne correspond pas'
                              : null,
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
                          onPressed: () {
                            if (_nomComplet.text.isNotEmpty &&
                                _email.text.isNotEmpty &&
                                _mdp.text.isNotEmpty) {
                              setState(() {
                                isLoading = true;
                              });
                              createAccount(
                                      _nomComplet.text, _email.text, _mdp.text)
                                  .then((user) {
                                if (user != null) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  print('Utilisateur connecté');
                                } else {
                                  print('La connexion a échoué');
                                }
                              });
                            } else {
                              print('Veillez renseigner les champs vides');
                            }
                          },
                        ),
                        SizedBox(height: 05.0),
                        /*    Text(
                error,style: TextStyle(color: Colors.red),
              ),  */
                        SizedBox(height: 20.0),
                        OutlinedButton(
                            onPressed: () {
                              widget.basculation();
                            },
                            child: Text('Vous avez déja un compte ?')),
                      ],
                    )),
              ),
            ),
    );
  }
}
