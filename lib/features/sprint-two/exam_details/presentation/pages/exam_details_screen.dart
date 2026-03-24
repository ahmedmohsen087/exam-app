import 'package:exam_app/features/sprint-two/exam_details/presentation/pages/start_exam_screen.dart';
import 'package:flutter/material.dart';

class ExamDetailsScreen extends StatelessWidget {
  static const String routeName = 'Exam Details Screen';
  const ExamDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, StartExamScreen.routeName);
          },
          child: Text('Go To Start Exam Page'),
        ),
        // child: hashToken == null
        //     ? CircularProgressIndicator(color: Colors.black)
        //     : Text(hashToken!, style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
