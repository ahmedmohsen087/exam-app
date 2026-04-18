import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/exam_questions/domain/entities/question.dart';

abstract class QuestionsRepo {
  Future<BaseResponse<List<Question>>> getQuestionsOnExam({
    required String token,
    required String examId,
  });
}
