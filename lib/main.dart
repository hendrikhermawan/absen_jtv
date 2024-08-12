import 'package:flutter/material.dart';
import 'screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Masuk & Keluar',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomeScreen(title: 'Form Masuk & Keluar'),
    );
  }
}
