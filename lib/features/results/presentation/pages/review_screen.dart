import 'package:exam_app/features/results/domain/entities/exam_attempt_entity.dart';
import 'package:exam_app/features/results/presentation/widgets/question_review_tile.dart';
import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  static const String routeName = "/review_screen";

  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final attempt = ModalRoute.of(context)!.settings.arguments as ExamAttempt;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Answers Review"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: attempt.questions.length,
        itemBuilder: (context, index) {
          return QuestionReviewTile(
            index: index,
            question: attempt.questions[index],
          );
        },
      ),
    );
  }
}
