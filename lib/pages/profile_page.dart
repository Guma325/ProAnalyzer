import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle_sharp,
              size: 150,
              color: Colors.grey[700],
            ),
            const SizedBox(height: 20),
            Text(
              "Nome Invocador",
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 21,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
