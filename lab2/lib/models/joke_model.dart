class JokeModel {
  final String type;
  final String setup;
  final String punchline;

  JokeModel({required this.type, required this.setup, required this.punchline});

  factory JokeModel.fromJson(Map<String, dynamic> json) {
    return JokeModel(
      type: json['type'] ?? '',
      setup: json['setup'] ?? '',
      punchline: json['punchline'] ?? '',
    );
  }
}
