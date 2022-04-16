import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:najlepszy_warsztat_samochodowy_w_warszawie/app/app.dart';
import 'package:najlepszy_warsztat_samochodowy_w_warszawie/app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
