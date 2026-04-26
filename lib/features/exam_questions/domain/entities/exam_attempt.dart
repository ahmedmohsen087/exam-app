import 'package:exam_app/features/exam_questions/domain/entities/question.dart';

class ExamAttempt {
  final String examId;
  final int total;
  final int correct;
  final int incorrect;
  final DateTime submittedAt;
  final List<Question>? questions;

  ExamAttempt({
    required this.examId,
    required this.total,
    required this.correct,
    required this.incorrect,
    required this.submittedAt,
    this.questions,
  });
}
