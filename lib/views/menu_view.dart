import 'package:flutter/material.dart';
import 'package:flutter_yaax/constants/constants.dart';
import 'package:flutter_yaax/views/profile_view.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'cart_view.dart';
import 'faves_view.dart';
import 'home_view.dart';

class MenuView extends StatefulWidget {
  static final String id = 'menu_view';

  @override
  _MenuViewState createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  int _currentIndex = 0;
  final List<Widget> pages = [
    HomeView(),
    Container(),
    CartView(),
    FavesView(),
    ProfileView(),
  ];

  final titles = [
    'Inicio',
    'Buscar',
    'Carrito',
    'Favoritos',
    'Perfil',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBEAEF),
      appBar: AppBar(
        backgroundColor: kColorGreen,
        title: Text(
          titles[_currentIndex],
          style: kFFGotham,
        ),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home_outlined),
            title: Text("Inicio"),
            selectedColor: kColorBrown,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text("Buscar"),
            selectedColor: kColorBrown,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            title: Text("Carrito"),
            selectedColor: kColorBrown,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            title: Text("Favoritos"),
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person_outline),
            title: Text("Perfil"),
            selectedColor: kColorBrown,
          )
        ],
      ),
    );
  }
}
