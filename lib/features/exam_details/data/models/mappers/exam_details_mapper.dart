import 'package:exam_app/features/exam_details/data/models/response/exam_details_response.dart';
import 'package:exam_app/features/exam_details/domain/entities/exam_details_entity.dart';

extension ExamMapper on Exam {
  ExamDetailsEntity toEntity() {
    return ExamDetailsEntity(
      id: id ?? "",
      title: title ?? "",
      duration: duration ?? 0,
      subjectId: subject ?? "",
      numberOfQuestions: numberOfQuestions ?? 0,
      isActive: active ?? false,
      createdAt: DateTime.tryParse(createdAt ?? "") ?? DateTime.now(),
    );
  }
}

extension ExamListMapper on List<Exam> {
  List<ExamDetailsEntity> toEntityList() {
    return map((e) => e.toEntity()).toList();
  }
}
