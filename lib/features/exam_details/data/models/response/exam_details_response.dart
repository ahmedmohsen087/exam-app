// To parse this JSON data, do
//
//     final examDetailsResponse = examDetailsResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'exam_details_response.g.dart';

ExamDetailsResponse examDetailsResponseFromJson(String str) =>
    ExamDetailsResponse.fromJson(json.decode(str));

String examDetailsResponseToJson(ExamDetailsResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ExamDetailsResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "metadata")
  Metadata? metadata;
  @JsonKey(name: "exams")
  List<Exam>? exams;

  ExamDetailsResponse({this.message, this.metadata, this.exams});

  factory ExamDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ExamDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExamDetailsResponseToJson(this);
}

@JsonSerializable()
class Exam {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "duration")
  int? duration;
  @JsonKey(name: "subject")
  String? subject;
  @JsonKey(name: "numberOfQuestions")
  int? numberOfQuestions;
  @JsonKey(name: "active")
  bool? active;
  @JsonKey(name: "createdAt")
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
  @JsonKey(name: "currentPage")
  int? currentPage;
  @JsonKey(name: "numberOfPages")
  int? numberOfPages;
  @JsonKey(name: "limit")
  int? limit;

  Metadata({this.currentPage, this.numberOfPages, this.limit});

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
