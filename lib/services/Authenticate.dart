import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freeshop/pages/login_screen.dart';
import 'package:freeshop/pages/page_acceuil.dart';

class Authenticate extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return PageAcceuil();
    } else {
      return LoginScreen();
    }
  }
}
