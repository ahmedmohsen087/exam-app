import 'package:exam_app/features/results/domain/entities/exam_attempt_entity.dart';

abstract class ResultsEvent {}

class LoadResultsEvent extends ResultsEvent {}

class SaveAttemptEvent extends ResultsEvent {
  final ExamAttempt attempt;

  SaveAttemptEvent(this.attempt);
}
