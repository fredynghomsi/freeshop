import 'package:flutter/material.dart';
import 'delayed_animation.dart';
import 'page_bienvenue.dart';
import 'package:freeshop/page_login.dart';

const d_red = const Color(0xFFE9717D);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Freeshop',
      debugShowCheckedModeBanner: false,
      home: PageBienvenue(),
    );
  }
}
