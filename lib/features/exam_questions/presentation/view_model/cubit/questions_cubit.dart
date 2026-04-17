import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/features/exam_questions/domain/entities/question.dart';
import 'package:exam_app/features/exam_questions/domain/use_cases/get_questions_on_exam_use_case.dart';
import 'package:exam_app/features/exam_questions/presentation/view_model/state/question_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../event/questions_event.dart';

@injectable
class QuestionsCubit extends Cubit<QuestionState> {
  GetQuestionsOnExamUseCase questionsOnExamUseCase;

  QuestionsCubit(this.questionsOnExamUseCase)
    : super(
        QuestionState(
          questionsApi: BaseState(isLoading: true, msg: null, data: null),
        ),
      );

  void doEvent(QuestionsEvent event) {
    switch (event) {
      case GetAllQuestionsOnExamEvent():
        _getAllQuestionsOnExam(token: event.token, examId: event.examId);
    }
  }

  Future<void> _getAllQuestionsOnExam({
    required String token,
    required String examId,
  }) async {
    emit(
      QuestionState(
        questionsApi: BaseState(isLoading: true, msg: null, data: null),
      ),
    );

    var response = await questionsOnExamUseCase(token: token, examId: examId);

    switch (response) {
      case Success<List<Question>>():
        emit(
          state.copyWith(
            questionsApi: BaseState(
              data: response.data,
              isLoading: false,
              msg: null,
            ),
          ),
        );
      case Failed<List<Question>>():
        emit(
          state.copyWith(
            questionsApi: BaseState(
              isLoading: false,
              data: null,
              msg: response.msg,
            ),
          ),
        );
    }
  }
}
