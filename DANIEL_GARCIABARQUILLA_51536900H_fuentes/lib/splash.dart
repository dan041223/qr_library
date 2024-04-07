import 'dart:async';
import 'dart:io';

import 'package:daniel_garcia_app_ev1/login.dart';
import 'package:flutter/material.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const Login(),
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage("assets/icon_background_removed.png"));
  }
}
