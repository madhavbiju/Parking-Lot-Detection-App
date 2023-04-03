import 'package:firebase_core/firebase_core.dart';
import 'package:parking_lot/new.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.white,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(),
      ),
      themeMode: ThemeMode.system,
      title: 'Student Directory',
      home: ReadData(),
    );
  }
}