import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/features/exam_questions/domain/entities/question.dart';

class QuestionState {
  QuestionState({required this.questionsApi});

  BaseState<List<Question>> questionsApi;

  QuestionState copyWith({BaseState<List<Question>>? questionsApi}) {
    return QuestionState(questionsApi: questionsApi ?? this.questionsApi);
  }
}

// ✅ Added
class ExamSubmittedState extends QuestionState {
  final int total;
  final int correct;

  ExamSubmittedState({
    required this.total,
    required this.correct,
    required super.questionsApi,
  });
}
