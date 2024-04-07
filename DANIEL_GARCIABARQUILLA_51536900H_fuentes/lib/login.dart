import 'package:daniel_garcia_app_ev1/bbdd.dart';
import 'package:daniel_garcia_app_ev1/qr_scanner.dart';
import 'package:daniel_garcia_app_ev1/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as security;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final storage = const FlutterSecureStorage();

  String? email;
  String? pass;
  String passTf = "";
  String resultado = "Nada";
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
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
                      content: Text(
                          "La contraseña debe tener mas de 6 caracteres")));
                  return;
                }

                Bbdd()
                    .signInWithEmail(
                        controllerEmail.text, controllerPass.text, context)
                    .then((resultado) {
                  if (resultado == true) {
                    saveLoginFile(controllerEmail.text, controllerPass.text);
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
          ElevatedButton(
              onPressed: () {
                Bbdd()
                    .signInWithEmail("Linkaot@htomail.com", "admin", context)
                    .then((resultado) {
                  if (resultado) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const QRScanner(),
                    ));
                  }
                });
              },
              child: Text("Login prueba"))
        ],
      ),
    ));
  }

  getUserData() async {
    email = await storage.read(key: 'email');
    pass = await storage.read(key: 'password');
    setState(() {});
    if (email != null && pass != null) {
      Bbdd().signInWithEmail(email, pass, context).then((iniciado) {
        if (iniciado) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const QRScanner(),
          ));
        }
      });
    }
  }

  saveLoginFile(String email, String pass) async {
    await storage.write(key: "email", value: email);
    await storage.write(key: "password", value: pass);
  }
}
