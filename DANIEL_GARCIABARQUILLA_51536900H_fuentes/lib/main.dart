import 'package:daniel_garcia_app_ev1/my_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://cnxbvjjpkcrfgcouohgn.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNueGJ2ampwa2NyZmdjb3VvaGduIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDkwMzY2MDksImV4cCI6MjAyNDYxMjYwOX0.YkDGmSKYoupSE1EV73pqy3JFtLrbrTrj-GFrfbVglfM',
  );
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setup();
  runApp(const MaterialApp(
    home: MyScaffold(
      body: Text('Activar el lector de QR'),
      currentIndex: 4,
    ),
    debugShowCheckedModeBanner: false,
  ));
}

setup() async {
  await Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();
}
