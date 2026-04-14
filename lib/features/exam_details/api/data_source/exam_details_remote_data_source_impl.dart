import '../../../../config/base_response/base_response.dart';
import '../client/exam_details_client.dart';
import '../../data/data_sources/exam_details_remote_data_source.dart';
import '../../data/models/response/exam_details_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExamDetailsRemoteDataSource)
class ExamDetailsRemoteDataSourceImpl extends ExamDetailsRemoteDataSource {
  final ExamDetailsClient _examDetailsClient;

  ExamDetailsRemoteDataSourceImpl(this._examDetailsClient);

  @override
  Future<BaseResponse<ExamDetailsResponse>> getSubjectExams({
    required String token,
    required String subjectId,
  }) async {
    try {
      final response = await _examDetailsClient.getSubjectExams(
        token,
        subjectId,
      );
      return Success<ExamDetailsResponse>(data: response);
    } catch (e) {
      return Failed<ExamDetailsResponse>(error: e);
    }
  }
}
