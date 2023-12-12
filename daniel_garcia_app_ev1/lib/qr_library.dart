import 'package:daniel_garcia_app_ev1/qr_record.dart';
import 'package:daniel_garcia_app_ev1/qr_scanner.dart';
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
    return Scaffold(
      body: const Column(
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
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined), label: "Library"),
        BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_2), label: "QR Reader"),
        BottomNavigationBarItem(
            icon: Icon(Icons.watch_later_outlined), label: "Record"),
      ], currentIndex: 0, onTap: pulsarOpcion),
    );
  }

  void pulsarOpcion(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const QRScanner(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const QR_Record(),
        ));
        break;
    }
  }
}
