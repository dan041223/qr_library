import 'package:flutter/material.dart';

class AlertDialogAddQR extends StatelessWidget {
  final void Function() onSave;
  final void Function() openURL;
  AlertDialogAddQR({super.key, required this.onSave, required this.openURL});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("¿Que quiere hacer con el QR?"),
      actions: [
        TextButton(
            onPressed: () {
              onSave();
              Navigator.pop(context);
            },
            child: const Text("Agregar QR a la libreria")),
        TextButton(
            onPressed: () async {
              openURL();
            },
            child: const Text("Buscar en navegador"))
      ],
    );
  }
}
