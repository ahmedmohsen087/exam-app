class QuestionWithAnswer {
  final String questionId;
  final String questionText;
  final List<String> options;

  final int correctAnswerIndex;
  final int userAnswerIndex;

  QuestionWithAnswer({
    required this.questionId,
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
    required this.userAnswerIndex,
  });
}
