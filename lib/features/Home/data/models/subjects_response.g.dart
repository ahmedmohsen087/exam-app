// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subjects_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectsResponse _$SubjectsResponseFromJson(Map<String, dynamic> json) =>
    SubjectsResponse(
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      subjects: (json['subjects'] as List<dynamic>?)
          ?.map((e) => SubjectDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubjectsResponseToJson(SubjectsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'subjects': instance.subjects,
    };
