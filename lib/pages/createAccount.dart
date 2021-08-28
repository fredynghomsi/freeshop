//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:freeshop/pages/login_screen.dart';
import 'package:freeshop/pages/page_acceuil.dart';
import 'package:freeshop/services/Methods.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _nomComplet = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _mdp = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: isLoading
          ? Center(
              child: Container(
                height: size.height / 20,
                width: size.height / 20,
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 50,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      width: size.width / 1.02,
                      child: IconButton(
                          icon: Icon(Icons.arrow_back_ios), onPressed: () {})),
                  SizedBox(
                    height: size.height / 20,
                  ),
                  Container(
                    width: size.width / 1.2,
                    child: Text(
                      "Freeshop",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: size.width / 1.3,
                    child: Text(
                      "Créer un compte et obtenez une meilleur expérience",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 15,
                  ),
                  Container(
                    width: size.width,
                    alignment: Alignment.center,
                    child: field(size, "Nom", Icons.people, _nomComplet),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Container(
                    width: size.width,
                    alignment: Alignment.center,
                    child: field(size, "Email", Icons.account_box, _email),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Container(
                      width: size.width,
                      alignment: Alignment.center,
                      child: field(size, "Mot de passe", Icons.lock, _mdp),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 25,
                  ),
                  customButton(size),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => LoginScreen())),
                      child: Text(
                        "Vous avez déja un compte!",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget customButton(Size size) {
    return GestureDetector(
      onTap: () {
        if (_nomComplet.text.isNotEmpty &&
            _email.text.isNotEmpty &&
            _mdp.text.isNotEmpty) {
          setState(() {
            isLoading = true;
          });
          createAccount(_nomComplet.text, _email.text, _mdp.text).then((user) {
            if (user != null) {
              setState(() {
                isLoading = false;
              });
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => PageAcceuil()));
              print('Compté crée avec succes');
            } else {
              print('La connexion a échoué');
            }
          });
        } else {
          print('Veillez renseigner les champs vides');
        }
      },
      child: Container(
        height: size.height / 14,
        width: size.width / 1.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.blue,
        ),
        alignment: Alignment.center,
        child: Text(
          "Creer un compte",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget field(
      Size size, String hintText, IconData icon, TextEditingController cont) {
    return Container(
      height: size.height / 14,
      width: size.width / 1.1,
      child: TextField(
        controller: cont,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
