import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../screens/exam_detail_screen.dart';

class ExamTile extends StatelessWidget {
  final Exam exam;

  const ExamTile({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(exam.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Date: ${exam.dateTime.toString().split('.')[0]}',
          ),
          Text('Location: ${exam.location}'),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExamDetailScreen(exam: exam),
          ),
        );
      },
    );
  }
}