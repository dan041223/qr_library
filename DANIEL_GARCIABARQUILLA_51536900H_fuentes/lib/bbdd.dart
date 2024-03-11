import 'dart:io';

import 'package:daniel_garcia_app_ev1/models/qr.dart';
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

  static Session? session;
  static User? user;

  Future<bool> signUp(email, pass, context) async {
    final AuthResponse res = await supabase.auth.signUp(
      email: email,
      password: pass,
    );
    session = res.session;
    user = res.user;
    if (session != null && user != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("User registered")));
      return true;
    }
    return true;
  }

  Future<bool> signInWithEmail(email, pass, context) async {
    final AuthResponse res =
        await supabase.auth.signInWithPassword(email: email, password: pass);
    session = res.session;
    user = res.user;
    if (session != null && user != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Usuario encontrado")));
      File("files\\auth_data.txt").writeAsString(session?.accessToken ?? "");
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
        .insert({"qr_url": result, "id_user": user?.id});
  }

  Future<List<QR>> obtainListOfQR() async {
    if (user == null) {
      return [];
    }
    final data = await supabase.from('qr').select("*").eq("id_user", user!.id);
    List<QR> listaQr = List.empty(growable: true);
    for (var qrMap in data) {
      QR qr = QR(qrMap["id_qr"], qrMap["qr_url"], qrMap["name_qr"],
          qrMap["description"], qrMap["qr_date"], qrMap["id_user"]);
      listaQr.add(qr);
    }
    return listaQr;
  }
}
