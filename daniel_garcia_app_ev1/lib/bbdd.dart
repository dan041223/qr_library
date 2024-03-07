import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Bbdd {
  inicializarBBDD() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Supabase.initialize(
      url: 'https://cnxbvjjpkcrfgcouohgn.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNueGJ2ampwa2NyZmdjb3VvaGduIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDkwMzY2MDksImV4cCI6MjAyNDYxMjYwOX0.YkDGmSKYoupSE1EV73pqy3JFtLrbrTrj-GFrfbVglfM',
    );
  }

  final supabase = Supabase.instance.client;
  late Session? session;
  late User? user;

  Future<bool> signInWithEmail(email, pass, context) async {
    final AuthResponse res =
        await supabase.auth.signInWithPassword(email: email, password: pass);
    session = res.session;
    user = res.user;
    if (session != null && user != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Usuario encontrado")));
      return true;
    }
    return false;
  }

  Future<void> signOut(context) async {
    await supabase.auth.signOut();
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Usuario deslogueado")));
  }

  Future<void> insertQR(result) async {
    await Supabase.instance.client
        .from("qr")
        .insert({"qr_url": result.toString(), "id_user": user?.id});
  }
}
