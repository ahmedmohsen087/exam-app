import 'package:exam_app/core/values/app_param.dart';
import 'package:flutter/material.dart';

class ExamQuestionsPageScreen extends StatelessWidget {
  static const String routeName = 'Exam Page Screen';

  const ExamQuestionsPageScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    final String examId = args?[AppParam.examId] ?? 'No ID';
    print("examID : $examId");
    return Scaffold(body: Center(child: Text('Exam Page')));
  }
}
