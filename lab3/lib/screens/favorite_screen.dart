import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorite_provider.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Accessing the favorite provider
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xFFF2BC94),
      appBar: AppBar(
        backgroundColor: Color(0xFF00154F),
        iconTheme: IconThemeData(
          color: Color(0xFFF4AF1B),
        ),
        title: Text(
          'Favorite Jokes',
          style: TextStyle(color: Color(0xFFF4AF1B)),
        ),
      ),
      body: ListView.builder(
        itemCount: favoriteProvider.favorites.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFF00154F),  // Blue background
            ),
            child: Text(
              favoriteProvider.favorites[index],
              style: TextStyle(
                color: Color(0xFFF4AF1B),  // Yellow text
                fontSize: 22,
                fontFamily: 'Times New Roman',  // Consistent font style
              ),
            ),
          );
        },
      ),
    );
  }
}
