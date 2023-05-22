import 'package:flutter/material.dart';
import 'package:myapp/components/my_button.dart';
import 'package:myapp/components/my_textfield.dart';
import 'package:myapp/pages/navbar_page.dart';
import 'package:myapp/pages/singup_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:myapp/services/auth_service.dart';
import 'package:provider/provider.dart';

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
  login(username, password) async {
    try {
      await context.read<AuthService>().login(username, password);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  void errorDialog(String text) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text(
              textAlign: TextAlign.center,
              text,
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }

  void logUserIn() async {
    String username = usernameController.text;
    String password = passwordController.text;

    if (!EmailValidator.validate(username)) {
      errorDialog("Email fora de formato.");
      return;
    }

    if (password.length < 6) {
      errorDialog("Senha deve ser maior do que 6 digitos.");
      return;
    }
    try {
      await context.read<AuthService>().login(username, password);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const NavBarPage()));
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage("images/Lolico.png"),
              width: 100,
            ),
            const SizedBox(height: 20),
            Text(
              "Bem vindo de volta Invocador!",
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 21,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 60),

            // Textfield email
            MyTextField(
                controller: usernameController,
                hintText: "Email",
                obscureText: false),
            const SizedBox(height: 20),

            // Textfield Senha
            MyTextField(
                controller: passwordController,
                hintText: "Senha",
                obscureText: true),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    "Esqueceu a senha?",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 60),

            MyButton(
              text: "Entrar",
              onTap: logUserIn,
            ),

            const SizedBox(height: 10),

            MyButton(
              text: "Cadastrar",
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const SingUpPage())),
            )
          ],
        ),
      ),
    );
  }
}
