import 'package:exam_app/features/exam_questions/domain/repositories/questions_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../entities/question.dart';

@injectable
class GetQuestionsOnExamUseCase {
  GetQuestionsOnExamUseCase(this.questionsRepo);

  QuestionsRepo questionsRepo;

  Future<BaseResponse<List<Question>>> call({
    required String token,
    required String examId,
  }) async {
    var response = await questionsRepo.getQuestionsOnExam(
      token: token,
      examId: examId,
    );
    switch (response) {
      case Success<List<Question>>():
        return Success<List<Question>>(data: response.data);
      case Failed<List<Question>>():
        return Failed<List<Question>>(msg: response.msg);
    }
  }
}
