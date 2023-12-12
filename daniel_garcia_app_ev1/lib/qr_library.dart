import 'package:daniel_garcia_app_ev1/my_scaffold.dart';
import 'package:flutter/material.dart';

class QR_Library extends StatefulWidget {
  const QR_Library({super.key});

  @override
  State<QR_Library> createState() => _QR_LibraryState();
}

// ignore: camel_case_types
class _QR_LibraryState extends State<QR_Library> {
  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      currentIndex: 0,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Aun no implementado", style: TextStyle(fontSize: 25))
            ],
          )
        ],
      ),
    );
  }
}
