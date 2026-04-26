import 'package:hive_ce/hive.dart';

part 'question_with_answer_hive_model.g.dart';

@HiveType(typeId: 1)
class QuestionWithAnswerModel {
  @HiveField(0)
  String questionId;

  @HiveField(1)
  String questionText;

  @HiveField(2)
  List<String> options;

  @HiveField(3)
  int correctAnswerIndex;

  @HiveField(4)
  int userAnswerIndex;

  QuestionWithAnswerModel({
    required this.questionId,
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
    required this.userAnswerIndex,
  });
}
