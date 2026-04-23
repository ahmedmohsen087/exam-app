import 'package:exam_app/config/hive/hive_model/models/exam_attempt_hive_model.dart';

abstract class ExamLocalDataSource {
  Future<void> saveAttempt(ExamAttemptModel model);

  Future<List<ExamAttemptModel>> getAttempts();
}
