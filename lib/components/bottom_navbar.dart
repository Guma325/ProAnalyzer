import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavbar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavbar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        mainAxisAlignment: MainAxisAlignment.center,
        tabActiveBorder: Border.all(color: Colors.black),
        gap: 8,
        tabs: [
          const GButton(
            icon: Icons.list_alt_outlined,
            text: "Home",
          ),
          const GButton(
            icon: Icons.account_circle_rounded,
            text: "Profile",
          ),
          GButton(
            icon: Icons.logout,
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
