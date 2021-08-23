import 'package:freeshop/inscription.dart';
import 'package:freeshop/page_login.dart';
import 'inscription.dart';
import 'main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'delayed_animation.dart';

class PageSocial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ), //fin de notre APPBAR
        body: SingleChildScrollView(
          child: Column(
            children: [
              DelayedAnimation(
                delay: 1000,
                child: Container(
                  height: 280,
                  child: Image.asset('images/shop_001.PNG'),
                ),
              ),
              DelayedAnimation(
                delay: 1000,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 30,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Le changement commence par ici",
                        style: GoogleFonts.poppins(
                          color: d_red,
                          fontSize: 16,
                          //fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Désormais vous avez la possibilité de vendre et acheter librement des produits dont vous voulez vous débarrassez",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              DelayedAnimation(
                delay: 3500,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 40,
                  ),
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PageLogin(),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              primary: d_red,
                              padding: EdgeInsets.all(13)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.mail_outline_outlined),
                              SizedBox(width: 10),
                              Text('Email'),
                            ],
                          )),
                      SizedBox(height: 20),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Inscription(),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              primary: Color(0xFF576dff),
                              padding: EdgeInsets.all(13)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.facebook_outlined),
                              SizedBox(width: 10),
                              Text('Inscription'),
                            ],
                          )),
                      SizedBox(height: 20),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              primary: Colors.white,
                              padding: EdgeInsets.all(13)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/google_logo.PNG',
                                height: 20,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Google',
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
