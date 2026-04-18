import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/exam_questions/data/models/question_dto.dart';
import 'package:exam_app/features/exam_questions/domain/entities/question.dart';
import 'package:exam_app/features/exam_questions/domain/repositories/questions_repo.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/questions_remote_data_source.dart';

@Injectable(as: QuestionsRepo)
class QuestionsRepoImp extends QuestionsRepo {
  QuestionsRepoImp(this.questionsRemoteDataSource);

  QuestionsRemoteDataSource questionsRemoteDataSource;

  @override
  Future<BaseResponse<List<Question>>> getQuestionsOnExam({
    required String token,
    required String examId,
  }) async {
    var response = await questionsRemoteDataSource.getQuestionsOnExam(
      token: token,
      examId: examId,
    );
    switch (response) {
      case Success<List<QuestionDto>>():
        return Success<List<Question>>(
          data: response.data?.map((e) => e.toQuestion()).toList(),
        );
      case Failed<List<QuestionDto>>():
        return Failed<List<Question>>(msg: response.msg);
    }
  }
}
