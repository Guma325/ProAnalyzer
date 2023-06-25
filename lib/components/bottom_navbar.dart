import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';

// ignore: must_be_immutable
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
        tabActiveBorder: Border.all(color: Colors.grey.shade50),
        gap: 8,
        tabs: [
          const GButton(
            icon: Icons.list_alt_outlined,
            text: "Home",
            //activeBorder: Border.fromBorderSide(BorderSide.none),
          ),
          const GButton(
            icon: Icons.account_circle_rounded,
            text: "Profile",
            //activeBorder: Border.fromBorderSide(BorderSide.none),
          ),
          GButton(
            icon: Icons.logout,
            //activeBorder: const Border.fromBorderSide(BorderSide.none),
            onPressed: () {
              context.read<AuthService>().logout();
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
