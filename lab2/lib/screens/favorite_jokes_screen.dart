import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<String> favoriteJokes;

  // Constructor to accept favoriteJokes list
  FavoritesScreen({required this.favoriteJokes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2BC94),
      appBar: AppBar(
        backgroundColor: Color(0xFF00154F),
        title: Text(
          'Favorite Jokes',
          style: TextStyle(color: Color(0xFFF4AF1B)),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: favoriteJokes.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                favoriteJokes[index],
                style: TextStyle(fontSize: 18, color: Color(0xFFF4AF1B)),
              ),
            ),
          );
        },
      ),
    );
  }
}
