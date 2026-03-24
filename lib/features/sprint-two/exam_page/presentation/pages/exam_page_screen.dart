import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExamPageScreen extends StatelessWidget {
  static const String routeName = 'Exam Page Screen';
  const ExamPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Exam Page')));
  }
}
