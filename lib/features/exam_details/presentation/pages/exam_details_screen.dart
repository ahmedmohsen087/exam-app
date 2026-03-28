import 'package:exam_app/features/exam_details/presentation/pages/start_exam_screen.dart';
import 'package:flutter/material.dart';

class ExamDetailsScreen extends StatelessWidget {
  static const String routeName = 'Exam Details Screen';

  static const String argSubjectId = 'subjectId';

  const ExamDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    final String subjectId = args?[argSubjectId] ?? 'No ID';
    print("SubjectID : $subjectId");

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, StartExamScreen.routeName);
          },
          child: Text('Go To Start Exam Page'),
        ),
      ),
    );
  }
}
