import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/answer.dart';

part 'answer_dto.g.dart';

@JsonSerializable()
class AnswerDto {
  @JsonKey(name: "answer")
  String? answer;

  @JsonKey(name: "key")
  String? key;

  AnswerDto({this.answer, this.key});

  factory AnswerDto.fromJson(Map<String, dynamic> json) =>
      _$AnswerDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerDtoToJson(this);

  @override
  String toString() {
    return answer ?? "No Content";
  }

  Answer toAnswer() {
    return Answer(answer: answer, key: key, isSelected: false);
  }
}
