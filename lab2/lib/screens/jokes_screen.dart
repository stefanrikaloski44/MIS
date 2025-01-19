import 'package:flutter/material.dart';
import '../services/api_service.dart';

class JokesScreen extends StatefulWidget {
  final String type;

  JokesScreen({required this.type});

  @override
  _JokesScreenState createState() => _JokesScreenState();
}

class _JokesScreenState extends State<JokesScreen> {
  late Future<List<String>> jokes;

  @override
  void initState() {
    super.initState();
    jokes = ApiServices.fetchJokes(widget.type);
  }

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
          'Jokes type: ${widget.type}',
          style: TextStyle(color: Color(0xFFF4AF1B)),
        ),
      ),
      body: FutureBuilder<List<String>>(
        future: jokes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          var jokesList = snapshot.data!;
          return ListView.builder(
            itemCount: jokesList.length,
            itemBuilder: (context, index) {
              bool isFavorite = favoriteJokes.contains(jokesList[index]);
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
                      child: Text(
                        jokesList[index],
                        style: TextStyle(
                          fontSize: 22,
                          color: Color(0xFFF4AF1B),
                          fontFamily: 'Times New Roman',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          if (isFavorite) {
                            favoriteJokes.remove(jokesList[index]);
                          } else {
                            favoriteJokes.add(jokesList[index]);
                          }
                        });
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
