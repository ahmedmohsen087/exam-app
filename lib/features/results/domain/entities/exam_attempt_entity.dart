import 'package:exam_app/features/results/domain/entities/question_with_answer_entity.dart';

class ExamAttempt {
  final String examId;
  final String title;
  final List<QuestionWithAnswer> questions;
  final int score;
  final DateTime submittedAt;

  ExamAttempt({
    required this.examId,
    required this.title,
    required this.questions,
    required this.score,
    required this.submittedAt,
  });
}
