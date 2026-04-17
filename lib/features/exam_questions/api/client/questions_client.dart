import 'package:dio/dio.dart';
import 'package:exam_app/core/values/api_param.dart';
import 'package:exam_app/core/values/endpoints.dart';
import 'package:exam_app/features/exam_questions/data/models/responses/questions_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'questions_client.g.dart';

@injectable
@RestApi(baseUrl: Endpoints.baseUrl)
abstract class QuestionsClient {
  @factoryMethod
  factory QuestionsClient(Dio dio) = _QuestionsClient;

  @GET(Endpoints.questionsOnExam)
  Future<QuestionsResponse> getQuestionsOnExam({
    @Header(ApiParam.token) required String token,
    @Query(ApiParam.examId) required String examId,
  });
}
