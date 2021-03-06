import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'delayed_animation.dart';
import 'delayed_animation.dart';
import 'page_social.dart';
import 'main.dart';

class PageBienvenue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 60,
            horizontal: 30,
          ),
          child: Column(
            children: [
              DelayedAnimation(
                delay: 1500,
                child: Container(
                  height: 170,
                  child: Image.asset('images/achat.png'),
                ),
              ),
              DelayedAnimation(
                delay: 2500,
                child: Container(
                  height: 400,
                  child: Image.asset('images/panier_02.jpeg'),
                ),
              ),
              DelayedAnimation(
                delay: 3500,
                child: Container(
                  margin: EdgeInsets.only(top: 05, bottom: 20),
                  child: Text(
                    "Freeshop est une application de vente libre destinĂ© pour les pays africain",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              DelayedAnimation(
                delay: 4500,
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: d_red,
                      shape: StadiumBorder(),
                      padding: EdgeInsets.all(
                          13), //padding permet de donner la forme arrondi a notre bouton commencer
                    ),
                    child: Text('COMMENCER'),
                    // Navigator.push permet de lier les deux pages grace au bouton COMMENCER
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PageSocial(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
