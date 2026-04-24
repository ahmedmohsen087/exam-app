sealed class QuestionsEvent {}

class GetAllQuestionsOnExamEvent extends QuestionsEvent {
  GetAllQuestionsOnExamEvent({required this.token, required this.examId});

  String token;
  String examId;
}
