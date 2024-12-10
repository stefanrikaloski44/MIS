import 'package:flutter/material.dart';

class RandomJokeScreen extends StatelessWidget {
  final String joke;

  RandomJokeScreen({required this.joke});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2BC94),
      appBar: AppBar(
        backgroundColor: Color(0xFF00154F),
        iconTheme: IconThemeData(
          color: Color(0xFFF4AF1B),
        ),
        title: Text(
          'Random joke of the day',
          style: TextStyle(
            color: Color(0xFFF4AF1B),
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Color(0xFF00154F),
          ),
          child: Text(
            joke,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 35,
              color: Color(0xFFF4AF1B),
                fontFamily:'Times New Roman',
            ),
          ),
        ),
      ),
    );
  }
}
