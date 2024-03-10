import 'package:daniel_garcia_app_ev1/bbdd.dart';
import 'package:daniel_garcia_app_ev1/login.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _LogOutState();
}

class _LogOutState extends State<SignUp> {
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
            "SignUp",
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
                Bbdd()
                    .signUp(controllerEmail.text, controllerPass.text, context)
                    .then((resultado) {
                  if (resultado) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const Login(),
                    ));
                  } else if (controllerPass.text.length < 6) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            "La contraseña debe tener más de 6 caracteres")));
                  }
                });
              },
              child: const Text("Sign Up")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const Login(),
                ));
              },
              child: const Text("Log In")),
        ],
      ),
    );
  }
}
