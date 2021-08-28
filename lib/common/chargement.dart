import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Chargement extends StatefulWidget {
  @override
  _ChargementState createState() => _ChargementState();
}

class _ChargementState extends State<Chargement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 100.0,
          horizontal: 70.0,
        ),
        child: Column(
          children: <Widget>[
            /*  Image.asset(
              'images/shop.png',
              height: 200,
              width: 200.0,
            ),  */
            SizedBox(height: 10.0),
            SpinKitChasingDots(
              color: Colors.amber,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
