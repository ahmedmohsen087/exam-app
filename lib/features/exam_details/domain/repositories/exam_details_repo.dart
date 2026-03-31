import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/exam_details/domain/entities/exam_details_entity.dart';

abstract class ExamDetailsRepo {
  Future<BaseResponse<List<ExamDetailsEntity>>> getSubjectExams({
    required String token,
    required String subjectId,
  });
}
