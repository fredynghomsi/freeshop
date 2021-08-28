/*  import 'package:flutter/material.dart';
import '/services/BDconnexion.dart';
//import 'package:freeshop/services/authentification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../main.dart';

class Inscription extends StatefulWidget {
  final Function basculation;
  Inscription({this.basculation});

  @override
  _InscriptionState createState() => _InscriptionState();
  //_AuthentificateScreenState createState() => _AuthentificateScreenState();
}

class _InscriptionState extends State<Inscription> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User courentUtil;

  //Collection Utilisateur depuis firestore
  CollectionReference collectionUtil =
      FirebaseFirestore.instance.collection('utilisateur');

  String nomComplet = '';
  String email = '';
  String mdp = '';
  String confirmMdp = '';

  // Ici nous creons la clé de notre formulaire

  final _formKey = GlobalKey<FormState>();
  var _obscureText = true;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.currentUser().then((User util) {
      setState(() {
        this.courentUtil = util;
      });
    });

    String _idUtil() {
      if (courentUtil != null) {
        return courentUtil.uid;
      } else {
        return "Pas d'utilisateur courant";
      }
    }

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
      ), //fin de notre APPBAR
      body: SingleChildScrollView(
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
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        // TODO: Appliquer de la logique
                        UserCredential result =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: mdp);

                        await collectionUtil.document(_idUtil()).setData({
                          'idUtil': _idUtil(),
                          'nomComplet': nomComplet,
                          'emailUtil': email
                        });

                        if (result == null) {
                          //error
                        }
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
*/