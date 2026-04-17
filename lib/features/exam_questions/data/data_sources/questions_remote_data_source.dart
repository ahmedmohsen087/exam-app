import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/exam_questions/data/models/question_dto.dart';

abstract class QuestionsRemoteDataSource {
  Future<BaseResponse<List<QuestionDto>>> getQuestionsOnExam({
    required String token,
    required String examId,
  });
}
