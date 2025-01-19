import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/custom_map_widget.dart';
import '../services/google_maps_service.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exam.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Date: ${exam.dateTime.toString().split('.')[0]}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Location: ${exam.location}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  if (exam.description.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    Text(
                      'Description:',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(exam.description),
                  ],
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: CustomMapWidget(
                latitude: exam.latitude,
                longitude: exam.longitude,
                title: exam.title,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  GoogleMapsService.openDirections(
                    exam.latitude,
                    exam.longitude,
                  );
                },
                icon: const Icon(Icons.directions),
                label: const Text('Get Directions'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}