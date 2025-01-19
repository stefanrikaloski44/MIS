import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/favorite_provider.dart';  // Import the favorite provider
import './screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '/firebase_options.dart';
import '../screens/notification_screen.dart';
import '../services/firebase_services.dart';



void main() {
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteProvider(),
      child: MaterialApp(
        title: 'Joke App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
