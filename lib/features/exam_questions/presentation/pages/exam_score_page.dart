import 'package:exam_app/features/exam_questions/domain/entities/question.dart';
import 'package:flutter/material.dart';

import '../../../../core/values/app_param.dart';

class ExamScorePage extends StatelessWidget {
  static String routeName = "exam score screen";

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments
            as Map<String, List<Question>?>;
    List<Question>? questions = args[AppParam.questions];
    questions
        ?.map(
          (e) => print(
            "correct answer : ${e.correctKey} \n selected answer : ${e.selectedKey}",
          ),
        )
        .toList();
    return Scaffold(body: Placeholder());
  }
}
