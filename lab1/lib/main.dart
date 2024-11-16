import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(ClothingApp());
}

class ClothingApp extends StatelessWidget {
  // const ClothingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing App',
      home: HomeScreen(),
    );
  }
}
