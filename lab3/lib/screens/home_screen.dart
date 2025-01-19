import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/api_service.dart';
import '../widgets/joke_card.dart';
import '../screens/jokes_screen.dart';
import '../screens/random_joke_screen.dart';
import '../screens/favorite_screen.dart';  // Add this import
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<String>> jokeTypes;

  @override
  void initState() {
    super.initState();
    jokeTypes = ApiService.fetchJokeTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2BC94),
      appBar: AppBar(
        backgroundColor: Color(0xFF00154F),
        title: Text(
          '211295\n LAB 3',
          style: TextStyle(color: Color(0xFFF4AF1B)),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Image.network(
              'https://i.ibb.co/GWK00ZV/1.png',
              width: 100,
              height: 100,
            ),
            onPressed: () async {
              var randomJoke = await ApiService.fetchRandomJoke();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RandomJokeScreen(joke: randomJoke),
                ),
              );
            },
          ),
          // Add heart icon for favorites
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.yellow, size: 30),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<String>>(
        future: jokeTypes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          var types = snapshot.data!;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7 / 1,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemCount: types.length,
            itemBuilder: (context, index) {
              return JokeCard(
                jokeType: types[index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JokesScreen(type: types[index]),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
