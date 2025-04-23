import 'package:flutter/material.dart';
import 'package:personal_finance_tracker/screens/home_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(title: "Material App", home: HomeScreen()));
}
