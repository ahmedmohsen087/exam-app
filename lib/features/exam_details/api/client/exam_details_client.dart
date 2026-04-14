import 'package:dio/dio.dart';
import 'package:exam_app/core/values/api_param.dart';
import '../../../../core/values/endpoints.dart';
import '../../data/models/response/exam_details_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'exam_details_client.g.dart';

@injectable
@RestApi(baseUrl: Endpoints.baseUrl)
abstract class ExamDetailsClient {
  @factoryMethod
  factory ExamDetailsClient(Dio dio) = _ExamDetailsClient;

  @GET(Endpoints.getSubjectExams)
  Future<ExamDetailsResponse> getSubjectExams(
    @Header(ApiParam.token) String token,
    @Query(ApiParam.subjectId) String subjectId,
  );
}
