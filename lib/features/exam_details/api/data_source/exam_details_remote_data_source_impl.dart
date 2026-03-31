import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/exam_details/api/client/exam_details_client.dart';
import 'package:exam_app/features/exam_details/data/data_sources/exam_details_remote_data_source.dart';
import 'package:exam_app/features/exam_details/data/models/response/exam_details_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExamDetailsRemoteDataSource)
class ExamDetailsRemoteDataSourceImpl implements ExamDetailsRemoteDataSource {
  final ExamDetailsClient _client;

  ExamDetailsRemoteDataSourceImpl(this._client);

  @override
  Future<BaseResponse<ExamDetailsResponse>> getSubjectExams({
    required String token,
    required String subjectId,
  }) async {
    try {
      final response = await _client.getSubjectExams(token, subjectId);
      return Success<ExamDetailsResponse>(data: response);
    } catch (e) {
      return Failed<ExamDetailsResponse>(error: e);
    }
  }
}
