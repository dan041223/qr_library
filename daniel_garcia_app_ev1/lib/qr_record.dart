import 'package:daniel_garcia_app_ev1/qr_library.dart';
import 'package:daniel_garcia_app_ev1/qr_scanner.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class QR_Record extends StatefulWidget {
  const QR_Record({super.key});

  @override
  State<QR_Record> createState() => _QR_RecordState();
}

// ignore: camel_case_types
class _QR_RecordState extends State<QR_Record> {
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
      bottomNavigationBar:
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined), label: "Library"),
        BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_2), label: "QR Reader"),
        BottomNavigationBarItem(
            icon: Icon(Icons.watch_later_outlined), label: "Record"),
      ], currentIndex: 2, onTap: pulsarOpcion),
    );
  }

  void pulsarOpcion(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const QR_Library(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const QRScanner(),
        ));
        break;
      case 2:
        break;
    }
  }
}
