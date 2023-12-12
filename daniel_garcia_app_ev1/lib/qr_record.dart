import 'package:daniel_garcia_app_ev1/my_scaffold.dart';
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
    return const MyScaffold(
      currentIndex: 2,
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
