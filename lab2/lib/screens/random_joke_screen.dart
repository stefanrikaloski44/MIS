import 'package:flutter/material.dart';

class RandomJokeScreen extends StatelessWidget {
  final String joke;
  final VoidCallback onFavorite;

  // Constructor to accept 'joke' and 'onFavorite'
  RandomJokeScreen({required this.joke, required this.onFavorite});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2BC94),
      appBar: AppBar(
        backgroundColor: Color(0xFF00154F),
        title: Text(
          'Random Joke of the Day',
          style: TextStyle(color: Color(0xFFF4AF1B)),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              joke,
              style: TextStyle(fontSize: 20, color: Color(0xFFF4AF1B)),
            ),
            IconButton(
              icon: Icon(Icons.favorite_border, color: Colors.red),
              onPressed: onFavorite, // Trigger the favorite callback
            ),
          ],
        ),
      ),
    );
  }
}
