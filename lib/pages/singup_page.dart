// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myapp/components/my_button.dart';
import 'package:myapp/components/my_textfield.dart';
import 'package:myapp/pages/navbar_page.dart';
import 'package:email_validator/email_validator.dart';

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
  void signUserIn() {
    String email = emailController.text;
    String summonerName = summonerController.text;
    String password = passwordController.text;
    String passwordConf = passwordConfController.text;

    password.compareTo(passwordConf);

    if (password.length < 6) {
      errorDialog("Senha deve ser maior do que 6 digitos");
    } else if (!EmailValidator.validate(email)) {
      errorDialog("Email fora de formato");
    } else if (summonerName.length < 4) {
      errorDialog("Nome deve conter mais de 4 caracteres");
    } else if (password != passwordConf) {
      errorDialog("As senhas devem ser iguais");
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (_) => NavBarPage()));
    }
  }

  void errorDialog(String text) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(text),
        );
      },
    );
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
              onTap: signUserIn,
            ),
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
