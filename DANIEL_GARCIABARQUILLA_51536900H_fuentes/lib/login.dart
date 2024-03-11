import 'package:daniel_garcia_app_ev1/bbdd.dart';
import 'package:daniel_garcia_app_ev1/qr_scanner.dart';
import 'package:daniel_garcia_app_ev1/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String emailTf = "";
  String passTf = "";
  String resultado = "Nada";
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(padding: EdgeInsets.symmetric()),
        const Text(
          "Login",
          style: TextStyle(fontSize: 30),
        ),
        const SizedBox(height: 20),
        const Text(
          "Email:",
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: const InputDecoration(labelText: "Email"),
          controller: controllerEmail,
        ),
        const SizedBox(height: 10),
        const Text(
          "Password",
          style: TextStyle(fontSize: 30),
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: const InputDecoration(labelText: "Password"),
          controller: controllerPass,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: () async {
              if (controllerPass.text.length < 6) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content:
                        Text("La contraseña debe tener mas de 6 caracteres")));
                return;
              }

              Bbdd()
                  .signInWithEmail(
                      controllerEmail.text, controllerPass.text, context)
                  .then((resultado) {
                if (resultado == true) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const QRScanner(),
                  ));
                }
              });
            },
            child: const Text("Sign In")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const SignUp(),
              ));
            },
            child: const Text("Sign Up")),
      ],
    ));
  }
}
