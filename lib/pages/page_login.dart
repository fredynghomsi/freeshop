import 'package:flutter/material.dart';
//import '../common/loading.dart';
import '../main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:freeshop/delayed_animation.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PageLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        //key: _formKey,
        child: Column(
          children: [
            DelayedAnimation(
              delay: 1000,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                //height: 280,
                child: Text(
                  "Connectez-vous à votre compte Email",
                  style: GoogleFonts.poppins(
                    color: d_red,
                    fontSize: 20, //fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            DelayedAnimation(
              delay: 1000,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  //vertical: 5,
                  horizontal: 20,
                ),
                height: 280,
                child: Text(
                  "Il est recommandé de vous connectez à votre adresse e-mail afin de nous permettre de mieux protéger vos informations",
                  //textAlign: TextAlign.center, le textAlign permet de centrer le text au milieux de l'écran
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 35),
            LoginForm(),
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
                  child: Text('CONFIRMER'),
                  // Navigator.push permet de lier les deux pages grace au bouton COMMENCER
                  onPressed: () {
                    // ici nous allons appller firebase
                    dynamic result = null;
                    // if(result == null){
                    //setState((){
                    //loading = false;
                    // error = 'Veillez entrer une adresse ou un mot de passe valide' ;
                    // })
                    //}
                  },
                ),
              ),
            ),
            SizedBox(
              height: 90,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 35),
                child: TextButton(
                  onPressed: () {
                    //Navigator.pop(context);
                  },
                  child: DelayedAnimation(
                    delay: 6500,
                    child: Text(
                      "Ignorer",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
  //_AuthentificateScreenState createState() => _AuthentificateScreenState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;
  final emailController = TextEditingController();
  final passController = TextEditingController();

  void disoose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  void toggleView() {
    setState(() {
      emailController.text = '';
      passController.text = '';
      //showSignIn = showSignIn;
    });
  }

  var _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return //loading ? Loading() :
        Container(
      //key: _formKey,
      margin: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: [
          DelayedAnimation(
            delay: 3500,
            child: TextFormField(
              controller: emailController,
              validator: (value) => value.isEmpty ? "Entrer E-mail" : null,
              decoration: InputDecoration(
                labelText: "Entrer E-mail",
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          DelayedAnimation(
              delay: 4500,
              child: TextFormField(
                controller: passController,
                validator: (value) => value.length < 4 ? "Mot de passe" : null,
                obscureText: _obscureText,
                decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    labelText: 'Mot de passe',
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
                    )),
              ))
        ],
      ),
    );
  }
}
