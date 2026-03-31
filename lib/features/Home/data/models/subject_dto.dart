

import 'package:exam_app/features/Home/domain/entities/subjects_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject_dto.g.dart';


@JsonSerializable()
class SubjectDto {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "icon")
  String? icon;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;

  SubjectDto({
    this.id,
    this.name,
    this.icon,
    this.createdAt,
  });

  SubjectsModels toDomain() => SubjectsModels(
    id: id,
    name: name,
    icon: icon,
    createdAt: createdAt,
  );




  factory SubjectDto.fromJson(Map<String, dynamic> json) => _$SubjectDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectDtoToJson(this);
}