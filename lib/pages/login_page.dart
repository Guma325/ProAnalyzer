// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myapp/components/my_button.dart';
import 'package:myapp/components/my_textfield.dart';
import 'package:myapp/pages/navbar_page.dart';
import 'package:myapp/pages/singup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controlador de edção dos textos:
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // Metodo Entrar
  void signUserIn(context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => NavBarPage()));
  }

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
            SizedBox(height: 20),
            Text(
              "Bem vindo de volta Invocador!",
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 21,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 60),
            MyTextField(
                controller: usernameController,
                hintText: "Email",
                obscureText: false),
            SizedBox(height: 20),
            MyTextField(
                controller: passwordController,
                hintText: "Senha",
                obscureText: true),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    "Esqueceu a senha?",
                    style: TextStyle(
                        color: Colors.grey,
                        //fontSize: 21,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            MyButton(
              text: "Entrar",
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => NavBarPage())),
            ),
            SizedBox(height: 10),
            MyButton(
              text: "Cadastrar",
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SingUpPage())),
            )
          ],
        ),
      ),
    );
  }
}
