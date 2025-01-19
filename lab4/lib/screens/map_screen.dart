import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/custom_map_widget.dart';

class MapScreen extends StatelessWidget {
  final List<Exam> exams;

  const MapScreen({super.key, required this.exams});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam Locations'),
      ),
      body: CustomMapWidget(
        markers: exams.map((exam) => {
          'latitude': exam.latitude,
          'longitude': exam.longitude,
          'title': exam.title,
        }).toList(),
      ),
    );
  }
}