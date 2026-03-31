sealed class ExamDetailsEvent {}

class FetchExamDetailsEvent extends ExamDetailsEvent {
  final String token;
  final String subjectId;

  FetchExamDetailsEvent({required this.token, required this.subjectId});
}
