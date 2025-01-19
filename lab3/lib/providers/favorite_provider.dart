import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  // List to store favorite jokes
  List<String> _favorites = [];

  // Getter for favorites
  List<String> get favorites => _favorites;

  // Function to add a joke to favorites
  void addToFavorites(String joke) {
    if (!_favorites.contains(joke)) {
      _favorites.add(joke);
      notifyListeners(); // Notify listeners that the favorites list has changed
    }
  }

  // Function to remove a joke from favorites
  void removeFromFavorites(String joke) {
    _favorites.remove(joke);
    notifyListeners(); // Notify listeners that the favorites list has changed
  }
}
