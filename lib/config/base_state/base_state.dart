import 'package:exam_app/features/exam_questions/domain/entities/question.dart';

class BaseState<T> {
  BaseState({required this.isLoading, this.data, this.msg});

  final bool isLoading;
  final T? data;
  final String? msg;

  BaseState<List<Question>>? copyWith({required List<Question> data}) {}
}
