// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myapp/components/my_button.dart';
import 'package:myapp/components/my_textfield.dart';
import 'package:myapp/pages/navbar_page.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  // Controlador de edção dos textos:
  final emailController = TextEditingController();
  final summonerController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfController = TextEditingController();

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
            const Image(
              image: AssetImage("images/Lolico.png"),
              width: 100,
            ),
            SizedBox(height: 20),
            Text(
              "Cadastro",
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 21,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            MyTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false),
            SizedBox(height: 20),
            MyTextField(
                controller: summonerController,
                hintText: "Nome do Invocador",
                obscureText: false),
            SizedBox(height: 20),
            MyTextField(
                controller: passwordController,
                hintText: "Senha",
                obscureText: true),
            SizedBox(height: 20),
            MyTextField(
                controller: passwordConfController,
                hintText: "Confirmação de Senha",
                obscureText: true),
            SizedBox(height: 60),
            MyButton(
                text: "Cadastrar",
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => NavBarPage()))),
            SizedBox(height: 10),
            MyButton(
              text: "Voltar",
              onTap: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}
