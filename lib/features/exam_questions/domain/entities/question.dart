import '../../data/models/answer.dart';
import '../../data/models/exam.dart';

class Question {
  List<Answer>? answers;
  String? type;
  String? id;
  String? question;
  String? correct;
  dynamic subject;
  Exam? exam;
  String? createdAt;

  Question({
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });
}
