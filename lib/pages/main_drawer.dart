import 'package:flutter/material.dart';
import 'package:freeshop/pages/page_acceuil.dart';
//import 'package:freeshop/pages/page_bienvenue.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(''), fit: BoxFit.fill),
                    ),
                  ),
                  // A ce niveau on affiche le nom de l'utilisateur
                  Text(
                    'Fredy Nghomsi',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  // A ce niveau on affiche l'adresse email de l'utilisateur
                  Text(
                    'flb830@gmail.com',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(PageAcceuil.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.add_shopping_cart),
            title: Text(
              'Panier',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(
              'Favoris',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Reglages',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.help_rounded),
            title: Text(
              'Aides',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text(
              'Quitter',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: null,
          ),
        ],
      ),
    );
  }
}
