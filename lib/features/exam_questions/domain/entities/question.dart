import 'package:exam_app/features/exam_questions/domain/entities/question_type.dart';

import '../../data/models/exam.dart';
import 'answer.dart';

class Question {
  List<Answer>? answers;
  QuestionType? type;
  String? id;
  String? question;
  String? correctKey;
  Exam? exam;
  String? createdAt;
  String? selectedKey;
  List<String?>? selectedKeyList;

  Question({
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correctKey,
    this.exam,
    this.createdAt,
    this.selectedKey,
    this.selectedKeyList,
  });
}
