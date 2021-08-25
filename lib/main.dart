import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freeshop/pages/page_acceuil.dart';
import 'delayed_animation.dart';
import 'pages/page_bienvenue.dart';
import 'package:freeshop/pages/page_login.dart';

const d_red = const Color(0xFFE9717D);

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // ce Widget permet de s'assuré que tout a été initialisé
  await Firebase.initializeApp(); // ceci nous permet de nous connecter à la BD
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Freeshop', debugShowCheckedModeBanner: false,
      //home: MenuPage(),
      //home: PageBienvenue(),
      routes: {
        '/': (_) => PageAcceuil(),
        PageAcceuil.routeName: (_) => PageAcceuil(),
      },
    );
  }
}
