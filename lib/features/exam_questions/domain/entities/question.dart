
import 'package:exam_app/features/exam_questions/domain/entities/question_type.dart';

import '../../data/models/exam.dart';
import 'answer.dart';

class Question {
  List<Answer>? answers;
  QuestionType? type;
  String? id;
  String? question;
  String? correct;
  Exam? exam;
  String? createdAt;

  Question({
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correct,
    this.exam,
    this.createdAt,
  });
}
