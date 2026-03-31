import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/exam_details/data/data_sources/exam_details_remote_data_source.dart';
import 'package:exam_app/features/exam_details/data/models/response/exam_details_response.dart';
import 'package:exam_app/features/exam_details/domain/entities/exam_details_entity.dart';
import 'package:exam_app/features/exam_details/domain/repositories/exam_details_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExamDetailsRepo)
class ExamDetailsRepoImpl implements ExamDetailsRepo {
  final ExamDetailsRemoteDataSource remoteDataSource;

  ExamDetailsRepoImpl(this.remoteDataSource);

  @override
  Future<BaseResponse<List<ExamDetailsEntity>>> getSubjectExams({
    required String token,
    required String subjectId,
  }) async {
    final response = await remoteDataSource.getSubjectExams(
      token: token,
      subjectId: subjectId,
    );

    if (response is Success<ExamDetailsResponse>) {
      final exams = response.data?.exams ?? [];
      final entities = exams.map((e) {
        return ExamDetailsEntity(
          id: e.id ?? "",
          title: e.title ?? "",
          duration: e.duration ?? 0,
          subjectId: e.subject ?? "",
          numberOfQuestions: e.numberOfQuestions ?? 0,
          isActive: e.active ?? false,
          createdAt: DateTime.tryParse(e.createdAt ?? "") ?? DateTime.now(),
        );
      }).toList();

      return Success<List<ExamDetailsEntity>>(data: entities);
    } else if (response is Failed<ExamDetailsResponse>) {
      return Failed<List<ExamDetailsEntity>>(
        msg: response.msg,
        error: response.error,
      );
    } else {
      return Failed<List<ExamDetailsEntity>>(msg: "Unknown error");
    }
  }
}
