import 'package:flutter/material.dart';
import 'package:myapp/components/bottom_navbar.dart';
import 'package:myapp/pages/login_page.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/pages/profile_page.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key});

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  int _selectedIndex = 0;
  void navigateBottomBar(newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const ProfilePage(),
    const LoginPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavbar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
