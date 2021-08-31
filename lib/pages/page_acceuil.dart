import 'package:flutter/material.dart';
import 'package:freeshop/pages/form_publication.dart';
import 'package:freeshop/pages/page_login.dart';

import 'main_drawer.dart';

class PageAcceuil extends StatefulWidget {
  const PageAcceuil({Key key}) : super(key: key);
  static const routeName = '/page_acceuil';
  @override
  _PageAcceuilState createState() => _PageAcceuilState();
}

class _PageAcceuilState extends State<PageAcceuil> {
  int _selectedIndex = 0;
  /*final screens = [
    PageAcceuil(),
    LoginForm(),
    FormPublication(),
  ];
*/
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const TextStyle optionStyle = TextStyle(
    fontSize: 7,
    fontWeight: FontWeight.bold,
    //color: Colors.black,
  );
  static const List<Widget> _widgetOptions = <Widget>[
    PageAcceuil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        //title: Text('Freeshop Acceuil'),
      ),
      drawer: MainDrawer(),
      //body: screens[_selectedIndex],
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.black),
            label: 'Recherche',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_a_photo_sharp,
              color: Colors.black,
            ),
            label: 'Publier',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_shopping_cart_outlined,
              color: Colors.black,
            ),
            label: 'Shop',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            label: 'Notification',
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
