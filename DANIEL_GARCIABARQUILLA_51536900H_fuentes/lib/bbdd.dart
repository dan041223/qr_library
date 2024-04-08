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
    if (session != null && user != null && context != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Usuario encontrado")));
      return true;
    } else if (context != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("User not found")));
    }
    return false;
  }

  Future<void> signOut(context) async {
    await supabase.auth.signOut();
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Usuario deslogueado")));
  }

  Future<void> insertQR(result) async {
    await supabase.from("qr").insert({"qr_url": result, "id_user": user?.id});
  }

  Future<void> insertRecordQR(String result) async {
    // ignore: non_constant_identifier_names
    // final QR = await supabase
    //     .from("qr")
    //     .select()
    //     .eq("qr_url", result)
    //     .eq("id_user", user!.id);

    // if (QR.isEmpty) {
    await supabase.from("qr").insert({"qr_url": result, "id_user": user?.id});
    // } else {
    //   final cosa = await supabase.from("qr").update({
    //     "description": DateTime.now().millisecondsSinceEpoch.toString()
    //   }).match({"id_qr": 99});
    //   if (cosa == null) {}
    // }
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

  Future<List<QR>> obtainQRRecord() async {
    if (user == null) {
      return [];
    }
    final data = await supabase
        .from('qr')
        .select("*")
        .eq("id_user", user!.id)
        .order("qr_date", ascending: true);
    List<QR> listaQr = List.empty(growable: true);
    for (var qrMap in data) {
      QR qr = QR(qrMap["id_qr"], qrMap["qr_url"], qrMap["name_qr"],
          qrMap["description"], qrMap["qr_date"], qrMap["id_user"]);
      listaQr.add(qr);
    }
    return listaQr;
  }
}
