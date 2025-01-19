import 'package:flutter/material.dart';

class JokeCard extends StatelessWidget {
  final String jokeType;
  final VoidCallback onTap;

  JokeCard({required this.jokeType, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF00154F),
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: GridTile(
          child: Center(
            child: Text(
              jokeType,
              style: TextStyle(fontSize: 28, color: Color(0xFFF4AF1B), fontFamily:'Times New Roman'),
            ),
          ),
        ),
      ),
    );
  }
}
