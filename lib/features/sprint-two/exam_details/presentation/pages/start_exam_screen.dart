import 'package:exam_app/features/sprint-two/exam_page/presentation/pages/exam_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StartExamScreen extends StatelessWidget {
  static const String routeName = 'Start Exam Screen';
  const StartExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, ExamPageScreen.routeName);
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
