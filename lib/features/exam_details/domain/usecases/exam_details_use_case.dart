import '../../../../config/base_response/base_response.dart';
import '../entities/exam_details_entity.dart';
import '../repositories/exam_details_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExamDetailsUseCase {
  final ExamDetailsRepo _examDetailsRepo;

  ExamDetailsUseCase(this._examDetailsRepo);

  Future<BaseResponse<List<ExamDetailsEntity>>> call({
    required String token,
    required String subjectId,
  }) {
    return _examDetailsRepo.getSubjectExams(token: token, subjectId: subjectId);
  }
}
