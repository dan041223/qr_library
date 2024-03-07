import 'package:daniel_garcia_app_ev1/my_scaffold.dart';
import 'package:daniel_garcia_app_ev1/qr_record.dart';
import 'package:daniel_garcia_app_ev1/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://cnxbvjjpkcrfgcouohgn.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNueGJ2ampwa2NyZmdjb3VvaGduIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDkwMzY2MDksImV4cCI6MjAyNDYxMjYwOX0.YkDGmSKYoupSE1EV73pqy3JFtLrbrTrj-GFrfbVglfM',
  );

  runApp(const MaterialApp(
    home: MyScaffold(
      body: Text('Activar el lector de QR'),
      currentIndex: 4,
    ),
    debugShowCheckedModeBanner: false,
  ));
}

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
