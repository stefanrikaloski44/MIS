import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String baseUrl = 'https://official-joke-api.appspot.com';


  static Future<List<String>> fetchJokeTypes() async {
    final response = await http.get(Uri.parse('$baseUrl/types'));
    if (response.statusCode == 200) {
      return List<String>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load!');
    }
  }


  static Future<List<String>> fetchJokes(String type) async {
    final response = await http.get(Uri.parse('$baseUrl/jokes/$type/ten'));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body) as List;
      return jsonResponse.map((joke) {
        return '${joke['setup']} - ${joke['punchline']}';
      }).toList();
    } else {
      throw Exception('Failed to load!');
    }
  }


  static Future<String> fetchRandomJoke() async {
    final response = await http.get(Uri.parse('$baseUrl/random_joke'));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return '${jsonResponse['setup']} - ${jsonResponse['punchline']}';
    } else {
      throw Exception('Failed to load!');
    }
  }
}
