import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/exam_details/data/models/response/exam_details_response.dart';

abstract class ExamDetailsRemoteDataSource {
  Future<BaseResponse<ExamDetailsResponse>> getSubjectExams({
    required String token,
    required String subjectId,
  });
}
