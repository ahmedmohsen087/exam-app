import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/features/exam_questions/domain/entities/question.dart';
import 'package:exam_app/features/exam_questions/domain/entities/question_type.dart';
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
      // Added
      case SelectAnswerEvent():
        _selectAnswer(event);
      // Added
      case SubmitExamEvent():
        _submitExam(event);
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

  // Added
  void _selectAnswer(SelectAnswerEvent event) {
    final questions = state.questionsApi.data!;

    for (var q in questions) {
      if (q.id == event.question.id) {
        if (q.type == QuestionType.singleChoice) {
          for (var a in q.answers!) {
            a.isSelected = false;
          }
          event.answer.isSelected = true;
          q.selectedKey = event.answer.key;
        }

        if (q.type == QuestionType.multipleChoice) {
          event.answer.isSelected = !event.answer.isSelected;
          q.selectedKeyList ??= [];

          if (event.answer.isSelected) {
            q.selectedKeyList!.add(event.answer.key);
          } else {
            q.selectedKeyList!.remove(event.answer.key);
          }
        }
      }
    }

    emit(state.copyWith(
      questionsApi: state.questionsApi,
    ));
  }

  // Added
  void _submitExam(SubmitExamEvent event) {
    final questions = event.questions;

    int total = questions.length;
    int correct = 0;

    for (var q in questions) {
      if (q.selectedKey == q.correctKey) {
        correct++;
      }
    }

    emit(
      ExamSubmittedState(
        total: total,
        correct: correct,
        questionsApi: state.questionsApi,
      ),
    );
  }
}
