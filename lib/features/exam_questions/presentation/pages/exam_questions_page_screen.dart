import 'package:flutter/material.dart';

class ExamQuestionsPageScreen extends StatelessWidget {
  static const String routeName = 'Exam Page Screen';

  const ExamQuestionsPageScreen({super.key});

  static const String argExamId = 'examId';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    final String examId = args?[argExamId] ?? 'No ID';
    print("examID : $examId");
    return Scaffold(body: Center(child: Text('Exam Page')));
  }
}
