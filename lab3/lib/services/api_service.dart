import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/joke_model.dart';  // If needed, import your models too.

class ApiService {
  static const String baseUrl = 'https://official-joke-api.appspot.com';

  // Fetch joke types (list of strings)
  static Future<List<String>> fetchJokeTypes() async {
    final response = await http.get(Uri.parse('$baseUrl/types'));
    if (response.statusCode == 200) {
      return List<String>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load joke types!');
    }
  }

  // Fetch jokes of a specific type (returns a list of JokeModel)
  static Future<List<JokeModel>> fetchJokes(String type) async {
    final response = await http.get(Uri.parse('$baseUrl/jokes/$type/ten'));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body) as List;
      return jsonResponse.map((joke) => JokeModel.fromJson(joke)).toList();
    } else {
      throw Exception('Failed to load jokes!');
    }
  }

  // Fetch a random joke (returns a single string)
  static Future<String> fetchRandomJoke() async {
    final response = await http.get(Uri.parse('$baseUrl/random_joke'));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return '${jsonResponse['setup']} - ${jsonResponse['punchline']}';
    } else {
      throw Exception('Failed to load random joke!');
    }
  }
}
