import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/question.dart';
import 'answer.dart';
import 'exam.dart';

part 'question_dto.g.dart';

@JsonSerializable()
class QuestionDto {
  @JsonKey(name: "answers")
  List<Answer>? answers;

  @JsonKey(name: "type")
  String? type;

  @JsonKey(name: "_id")
  String? id;

  @JsonKey(name: "question")
  String? question;

  @JsonKey(name: "correct")
  String? correct;

  @JsonKey(name: "subject")
  dynamic subject;

  @JsonKey(name: "exam")
  Exam? exam;

  @JsonKey(name: "createdAt")
  String? createdAt;

  QuestionDto({
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });

  factory QuestionDto.fromJson(Map<String, dynamic> json) =>
      _$QuestionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionDtoToJson(this);

  Question toQuestion() {
    return Question(
      id: id,
      createdAt: createdAt,
      answers: answers,
      correct: correct,
      exam: exam,
      question: question,
      subject: subject,
      type: type,
    );
  }
}
