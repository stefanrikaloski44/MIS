import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/api_service.dart';
import '../providers/favorite_provider.dart'; // Import the favorite provider
import '../models/joke_model.dart';  // Import your JokeModel

class JokesScreen extends StatelessWidget {
  final String type;

  JokesScreen({required this.type});

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
          'Jokes type: $type',
          style: TextStyle(color: Color(0xFFF4AF1B)),
        ),
      ),
      body: FutureBuilder<List<JokeModel>>(
        future: ApiService.fetchJokes(type),  // Fetch JokeModel list
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          // Extract joke text from JokeModel
          var jokes = snapshot.data!;
          return ListView.builder(
            itemCount: jokes.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFF00154F),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            jokes[index].setup,
                            style: TextStyle(
                              fontSize: 22,
                              color: Color(0xFFF4AF1B),
                              fontFamily: 'Times New Roman',
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            jokes[index].punchline,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFFF4AF1B),
                              fontFamily: 'Times New Roman',
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: favoriteProvider.favorites.contains(jokes[index].setup)
                            ? Colors.red
                            : Colors.grey,
                      ),
                      onPressed: () {
                        if (favoriteProvider.favorites.contains(jokes[index].setup)) {
                          favoriteProvider.removeFromFavorites(jokes[index].setup);
                        } else {
                          favoriteProvider.addToFavorites(jokes[index].setup);
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
