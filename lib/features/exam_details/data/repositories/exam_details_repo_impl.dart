import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/exam_details/data/data_sources/exam_details_remote_data_source.dart';
import 'package:exam_app/features/exam_details/data/models/mappers/exam_details_mapper.dart';
import 'package:exam_app/features/exam_details/data/models/response/exam_details_response.dart';
import 'package:exam_app/features/exam_details/domain/entities/exam_details_entity.dart';
import 'package:exam_app/features/exam_details/domain/repositories/exam_details_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExamDetailsRepo)
class ExamDetailsRepoImpl implements ExamDetailsRepo {
  final ExamDetailsRemoteDataSource examDetailsRemoteDataSource;

  ExamDetailsRepoImpl(this.examDetailsRemoteDataSource);

  @override
  Future<BaseResponse<List<ExamDetailsEntity>>> getSubjectExams({
    required String token,
    required String subjectId,
  }) async {
    final response = await examDetailsRemoteDataSource.getSubjectExams(
      token: token,
      subjectId: subjectId,
    );

    switch (response) {
      case Success<ExamDetailsResponse>():
        final exams = response.data?.exams ?? [];
        final entities = exams.map((e) => e.toEntity()).toList();

        return Success<List<ExamDetailsEntity>>(data: entities);

      case Failed<ExamDetailsResponse>():
        return Failed<List<ExamDetailsEntity>>(error: response.error);
    }
  }
}
