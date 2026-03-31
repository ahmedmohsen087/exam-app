import 'package:flutter/material.dart';

import '../../../../core/values/app_param.dart';
import '../../../exam_questions/presentation/pages/exam_questions_page_screen.dart';

class StartExamScreen extends StatelessWidget {
  static const String routeName = 'Start Exam Screen';

  const StartExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              ExamQuestionsPageScreen.routeName,
              arguments: {AppParam.examId: "670070a830a3c3c1944a9c63"},
            );
          },
          child: Text('Go To Exam Page'),
        ),
        // child: hashToken == null
        //     ? CircularProgressIndicator(color: Colors.black)
        //     : Text(hashToken!, style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
