sealed class ExamDetailsEvent {}

class GetSubjectExamsEvent extends ExamDetailsEvent {
  final String token;
  final String subjectId;

  GetSubjectExamsEvent({required this.token, required this.subjectId});
}
