import 'package:exam_app/features/results/domain/entities/exam_attempt_entity.dart';

class ResultsState {
  final bool isLoading;
  final List<ExamAttempt> attempts;
  final String? error;

  ResultsState({
    this.isLoading = false,
    this.attempts = const [],
    this.error,
  });

  ResultsState copyWith({
    bool? isLoading,
    List<ExamAttempt>? attempts,
    String? error,
  }) {
    return ResultsState(
      isLoading: isLoading ?? this.isLoading,
      attempts: attempts ?? this.attempts,
      error: error,
    );
  }
}
