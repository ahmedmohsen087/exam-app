import '../entities/exam_attempt_entity.dart';

abstract class ResultsRepository {
  Future<void> saveAttempt(ExamAttempt entity);

  Future<List<ExamAttempt>> getAttempts();
}
