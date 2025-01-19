import 'package:uuid/uuid.dart';

class Exam {
  final String id;
  final String title;
  final DateTime dateTime;
  final String location;
  final double latitude;
  final double longitude;
  final String description;

  Exam({
    String? id,
    required this.title,
    required this.dateTime,
    required this.location,
    required this.latitude,
    required this.longitude,
    this.description = '',
  }) : id = id ?? const Uuid().v4();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'dateTime': dateTime.toIso8601String(),
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'description': description,
    };
  }

  factory Exam.fromMap(Map<String, dynamic> map) {
    return Exam(
      id: map['id'],
      title: map['title'],
      dateTime: DateTime.parse(map['dateTime']),
      location: map['location'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      description: map['description'],
    );
  }
}