import 'package:json_annotation/json_annotation.dart';

part 'answer.g.dart';

@JsonSerializable()
class Answer {
  @JsonKey(name: "answer")
  String? answer;

  @JsonKey(name: "key")
  String? key;

  Answer({
    this.answer,
    this.key,
  });

  factory Answer.fromJson(Map<String, dynamic> json) =>
      _$AnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}
