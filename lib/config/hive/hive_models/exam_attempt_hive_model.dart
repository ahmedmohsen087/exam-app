import 'package:exam_app/config/hive/hive_models/question_with_answer_hive_model.dart';
import 'package:hive_ce/hive.dart';

part 'exam_attempt_hive_model.g.dart';

@HiveType(typeId: 0)
class ExamAttemptModel {
  @HiveField(0)
  String examId;

  @HiveField(1)
  String title;

  @HiveField(2)
  int score;

  @HiveField(3)
  DateTime submittedAt;

  @HiveField(4)
  List<QuestionWithAnswerModel> questions;

  ExamAttemptModel({
    required this.examId,
    required this.title,
    required this.score,
    required this.submittedAt,
    required this.questions,
  });
}
