// To parse this JSON data, do
//
//     final examDetailsResponse = examDetailsResponseFromJson(jsonString);

import 'package:exam_app/core/strings/features/exam_details/exam_details_strings.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'exam_details_response.g.dart';

ExamDetailsResponse examDetailsResponseFromJson(String str) =>
    ExamDetailsResponse.fromJson(json.decode(str));

String examDetailsResponseToJson(ExamDetailsResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ExamDetailsResponse {
  @JsonKey(name: ExamDetailsStrings.message)
  String? message;
  @JsonKey(name: ExamDetailsStrings.metaData)
  Metadata? metadata;
  @JsonKey(name: ExamDetailsStrings.exams)
  List<Exam>? exams;

  ExamDetailsResponse({this.message, this.metadata, this.exams});

  factory ExamDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ExamDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExamDetailsResponseToJson(this);
}

@JsonSerializable()
class Exam {
  @JsonKey(name: ExamDetailsStrings.id)
  String? id;
  @JsonKey(name: ExamDetailsStrings.title)
  String? title;
  @JsonKey(name: ExamDetailsStrings.duration)
  int? duration;
  @JsonKey(name: ExamDetailsStrings.subject)
  String? subject;
  @JsonKey(name: ExamDetailsStrings.numberOfQuestions)
  int? numberOfQuestions;
  @JsonKey(name: ExamDetailsStrings.active)
  bool? active;
  @JsonKey(name: ExamDetailsStrings.createdAt)
  String? createdAt;

  Exam({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);

  Map<String, dynamic> toJson() => _$ExamToJson(this);
}

@JsonSerializable()
class Metadata {
  @JsonKey(name: ExamDetailsStrings.currentPage)
  int? currentPage;
  @JsonKey(name: ExamDetailsStrings.numberOfPages)
  int? numberOfPages;
  @JsonKey(name: ExamDetailsStrings.limit)
  int? limit;

  Metadata({this.currentPage, this.numberOfPages, this.limit});

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
