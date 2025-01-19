import 'package:flutter/material.dart';
import '../services/api_service.dart';

class JokesScreen extends StatelessWidget {
  final String type;

  JokesScreen({required this.type});

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
          'Jokes type: $type',
          style: TextStyle(color: Color(0xFFF4AF1B)),
        ),
      ),
      body: FutureBuilder<List<String>>(
        future: ApiServices.fetchJokes(type),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
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
                child: Text(
                  jokes[index],
                  style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFFF4AF1B),
                      fontFamily: 'Times New Roman'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
