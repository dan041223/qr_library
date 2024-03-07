import 'package:daniel_garcia_app_ev1/login.dart';
import 'package:daniel_garcia_app_ev1/qr_library.dart';
import 'package:daniel_garcia_app_ev1/qr_record.dart';
import 'package:daniel_garcia_app_ev1/qr_scanner.dart';
import 'package:flutter/material.dart';

class MyScaffold extends StatefulWidget {
  final Widget body;
  final int currentIndex;
  const MyScaffold({required this.currentIndex, required this.body, super.key});

  @override
  State<MyScaffold> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  final GlobalKey<ScaffoldMessengerState> snackbarKey =
      GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.currentIndex != 4
          ? widget.body
          : const Center(child: Login()
              // child: ElevatedButton(
              //   onPressed: () =>
              //       Navigator.of(context).pushReplacement(MaterialPageRoute(
              //     builder: (context) => const QRScanner(),
              //   )),
              //   child: const Text("Pulsa para iniciar el lector de QR"),
              // ),
              ),
      bottomNavigationBar: widget.currentIndex != 4
          ? BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.list_outlined), label: "Library"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.qr_code_2), label: "QR Reader"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.watch_later_outlined), label: "Record"),
              ],
              currentIndex: widget.currentIndex == 4 ? 1 : widget.currentIndex,
              onTap: (index) => pulsarOpcion(index, context),
            )
          : null,
    );
  }

  void pulsarOpcion(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const QR_Library(),
        ));
        break;
      case 1:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const QRScanner(),
        ));
        break;
      case 2:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const QR_Record(),
        ));
        break;
    }
  }
}
