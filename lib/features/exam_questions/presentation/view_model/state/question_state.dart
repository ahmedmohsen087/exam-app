import 'package:exam_app/config/base_state/base_state.dart';

class QuestionState {
  QuestionState({required this.questionsApi});

  BaseState questionsApi;

  QuestionState copyWith({BaseState? questionsApi}) {
    return QuestionState(questionsApi: questionsApi ?? this.questionsApi);
  }
}
