import 'package:flutter/material.dart';
import 'package:freeshop/services/authentification.dart';

import '../main.dart';

class Inscription extends StatefulWidget {
  final Function(int, String) onChangedStep;

  const Inscription({
    Key key,
    this.onChangedStep,
  }) : super(key: key);

  @override
  _InscriptionState createState() => _InscriptionState();
  //_AuthentificateScreenState createState() => _AuthentificateScreenState();
}

class _InscriptionState extends State<Inscription> {
  final AuthentificationService _auth = AuthentificationService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showSignIn = true;
  bool loading = false;

  /* final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");
  bool _isSecret = true;
  String _email = '';
  String _password = '';
  */

  var _obscureText = true;

  @override
  void toggleView() {
    setState(() {
      _formKey.currentState.reset();
      error = '';
      emailController.text = '';
      passwordController.text = '';
      showSignIn = !showSignIn;
    });
  }

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
            onPressed: () => widget.onChangedStep(0, null),
            /* {
            Navigator.pop(context);
          },*/
          ),
          title: Text(showSignIn ? 'Creer un compte' : 'Se connecter'),
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.person),
              label: Text(showSignIn ? 'Creer un compte' : 'Se connecter'),
              onPressed: () => toggleView(),
            ),
          ]), //fin de notre APPBAR
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30),
          child: Form(
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
              /* TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nom et Prenom',
                  //border: OutlineInputBorder(),
                ),
              ),*/
              SizedBox(height: 10.0),
              TextFormField(
                //onChanged: (value) => setState(() => _email = value),
                controller: emailController,
                validator: (value) => value.isEmpty
                    ? 'Veillez entrer une adresse email valide'
                    : null,
                decoration: InputDecoration(
                  labelText: 'adresse email',
                  //border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: passwordController,
                validator: (value) => value.length < 6
                    ? "Entrer le mot de passe d\'au moins 6 caracteres"
                    : null,
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
              /* SizedBox(height: 10.0),
              TextFormField(
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
              ),*/
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
                    setState(() => loading = true);
                    var password = passwordController.value.text;
                    var email = emailController.value.text;

                    // Connexion à Firebase auth
                    dynamic result = showSignIn
                        ? await _auth.SignInWithEmailAndPassword(
                            email, password)
                        : await _auth.RegisterWithEmailAndPassword(
                            email, password);
                    if (result == null) {
                      setState(() {
                        loading = false;
                        error = 'Veillez entrer une adresse valide';
                      });
                    }
                  }
                },
              ),
              SizedBox(height: 05.0),
              Text(
                error,
                style: TextStyle(color: Colors.red),
              ),
              SizedBox(height: 20.0),
              OutlinedButton(
                  onPressed: () {}, child: Text('Avez-vous déja un compte ?')),
            ],
          )),
        ),
      ),
    );
  }
}
