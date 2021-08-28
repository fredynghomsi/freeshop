import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freeshop/pages/login_screen.dart';
//import 'package:firebase_core/firebase_core.dart';

Future<User> createAccount(
    String _nomComplet, String _email, String _mdp) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    User user = (await _auth.createUserWithEmailAndPassword(
            email: _email, password: _mdp))
        .user;

    if (user != null) {
      print("Compte crée avec succès");
    } else {
      print("Echec de création du compte");
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future<User> logIn(String email, String mdp) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    User user =
        (await _auth.signInWithEmailAndPassword(email: email, password: mdp))
            .user;
    if (user != null) {
      print('Connexion établie avec succès');
      return user;
    } else {
      print('Echec de connexion');
      return user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future logOut(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut().then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
    });
  } catch (e) {
    print("erreur");
  }
}
