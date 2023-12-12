import 'package:daniel_garcia_app_ev1/qr_record.dart';
import 'package:daniel_garcia_app_ev1/qr_scanner.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lector de QR')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const QRScanner(),
            ));
          },
          child: const Text('Activar el lector de QR'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.list_outlined), label: "Library"),
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_2), label: "QR Reader"),
          BottomNavigationBarItem(
              icon: Icon(Icons.watch_later_outlined), label: "Record"),
        ],
        currentIndex: 0,
        onTap: (index) => pulsarOpcion(index, context),
      ),
    );
  }

  void pulsarOpcion(int index, BuildContext context) {
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
