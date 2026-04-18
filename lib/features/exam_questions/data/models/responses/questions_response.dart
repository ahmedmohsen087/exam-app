import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import '../question_dto.dart';

part 'questions_response.g.dart';

QuestionsResponse questionsResponseFromJson(String str) =>
    QuestionsResponse.fromJson(json.decode(str));

String questionsResponseToJson(QuestionsResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class QuestionsResponse {
  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "questions")
  List<QuestionDto>? questions;

  QuestionsResponse({
    this.message,
    this.questions,
  });

  factory QuestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsResponseToJson(this);
}
