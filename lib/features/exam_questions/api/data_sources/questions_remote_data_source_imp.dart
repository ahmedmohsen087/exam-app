import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/exam_questions/data/models/question_dto.dart';
import 'package:injectable/injectable.dart';

import '../../data/data_sources/questions_remote_data_source.dart';
import '../client/questions_client.dart';

@Injectable(as: QuestionsRemoteDataSource)
class QuestionsRemoteDataSourceImp extends QuestionsRemoteDataSource {
  QuestionsRemoteDataSourceImp(this.client);

  final QuestionsClient client;

  @override
  Future<BaseResponse<List<QuestionDto>>> getQuestionsOnExam({
    required String token,
    required String examId,
  }) async {
    try {
      var response = await client.getQuestionsOnExam(
        token: token,
        examId: examId,
      );
      return Success<List<QuestionDto>>(data: response.questions);
    } catch (e) {
      return Failed<List<QuestionDto>>(error: e);
    }
  }
}
