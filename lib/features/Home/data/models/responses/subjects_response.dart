import 'package:exam_app/features/Home/data/models/subject_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import '../meta_data.dart';

part 'subjects_response.g.dart';


@JsonSerializable()
class SubjectsResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "metadata")
  Metadata? metadata;
  @JsonKey(name: "subjects")
  List<SubjectDto>? subjects;

  SubjectsResponse({
    this.message,
    this.metadata,
    this.subjects,
  });

  factory SubjectsResponse.fromJson(Map<String, dynamic> json) => _$SubjectsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectsResponseToJson(this);
}




