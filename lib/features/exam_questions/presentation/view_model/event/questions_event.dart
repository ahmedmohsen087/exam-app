import 'package:exam_app/features/exam_questions/domain/entities/answer.dart';
import 'package:exam_app/features/exam_questions/domain/entities/question.dart';

sealed class QuestionsEvent {}

class GetAllQuestionsOnExamEvent extends QuestionsEvent {
  GetAllQuestionsOnExamEvent({required this.token, required this.examId});

  String token;
  String examId;
}

// added
class SelectAnswerEvent extends QuestionsEvent {
  final Question question;
  final Answer answer;

  SelectAnswerEvent(this.question, this.answer);
}

// Added
class SubmitExamEvent extends QuestionsEvent {
  final List<Question> questions;

  SubmitExamEvent({required this.questions});
}
