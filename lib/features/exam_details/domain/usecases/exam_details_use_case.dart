import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/exam_details/domain/entities/exam_details_entity.dart';
import 'package:exam_app/features/exam_details/domain/repositories/exam_details_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExamDetailsUseCase {
  final ExamDetailsRepo _repo;

  ExamDetailsUseCase(this._repo);

  Future<BaseResponse<List<ExamDetailsEntity>>> call({
    required String token,
    required String subjectId,
  }) async {
    return await _repo.getSubjectExams(token: token, subjectId: subjectId);
  }
}
