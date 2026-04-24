enum QuestionType {
  trueFalse("true_false"),
  singleChoice("single_choice"),
  multipleChoice("multiple_choice");

  final String apiValue;

  const QuestionType(this.apiValue);

  static QuestionType fromApi(String value) {
    return QuestionType.values.firstWhere((e) {
      return e.apiValue == value;
    }, orElse: () => throw Exception("Unknown type"));
  }
}
