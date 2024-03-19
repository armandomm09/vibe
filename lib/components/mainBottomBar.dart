import 'package:flutter/material.dart';
import 'package:flutter_application_5/pages/profile_page.dart';
import 'package:flutter_application_5/pages/users_list.dart';
import 'package:flutter_application_5/pages/main_page.dart';

class MainBottomBar extends StatefulWidget {
  const MainBottomBar({super.key});

  @override
  State<MainBottomBar> createState() => _MainBottomBarState();
}

class _MainBottomBarState extends State<MainBottomBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPage(currentIndex), // Mostrar la página correspondiente al índice actual
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mobile_friendly),
            label: "Mobile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        backgroundColor: Colors.amber,
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return PostsPage(); // Reemplaza con tu widget de la página "Home"
      case 1:
        return MainPage(); // Reemplaza con tu widget de la página "Mobile"
      case 2:
        return ProfilePage(); // Reemplaza con tu widget de la página "Profile"
      default:
        return Container(); // Página por defecto o error
    }
  }
}
