import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:najlepszy_warsztat_samochodowy_w_warszawie/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
