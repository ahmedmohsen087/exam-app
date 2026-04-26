import 'package:exam_app/config/hive/hive_model/models/exam_attempt_hive_model.dart';
import 'package:exam_app/config/hive/hive_model/models/question_with_answer_hive_model.dart';
import 'package:exam_app/features/results/domain/entities/exam_attempt_entity.dart';
import 'package:exam_app/features/results/domain/entities/question_with_answer_entity.dart';

class ResultsHiveMapper {
  static ExamAttemptModel toHive(ExamAttempt entity) {
    return ExamAttemptModel(
      examId: entity.examId,
      title: entity.title,
      score: entity.score,
      submittedAt: entity.submittedAt,
      questions: entity.questions.map(_questionToHive).toList(),
    );
  }

  static QuestionWithAnswerModel _questionToHive(QuestionWithAnswer entity) {
    return QuestionWithAnswerModel(
      questionId: entity.questionId,
      questionText: entity.questionText,
      options: entity.options,
      correctAnswerIndex: entity.correctAnswerIndex,
      userAnswerIndex: entity.userAnswerIndex,
    );
  }

  static ExamAttempt fromHive(ExamAttemptModel model) {
    return ExamAttempt(
      examId: model.examId,
      title: model.title,
      score: model.score,
      submittedAt: model.submittedAt,
      questions: model.questions
          .cast<QuestionWithAnswerModel>()
          .map(_questionFromHive)
          .toList(),
    );
  }

  static QuestionWithAnswer _questionFromHive(QuestionWithAnswerModel model) {
    return QuestionWithAnswer(
      questionId: model.questionId,
      questionText: model.questionText,
      options: model.options,
      correctAnswerIndex: model.correctAnswerIndex,
      userAnswerIndex: model.userAnswerIndex,
    );
  }
}
