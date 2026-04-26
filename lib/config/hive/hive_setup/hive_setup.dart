import 'package:exam_app/config/hive/hive_models/question_with_answer_hive_model.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:exam_app/config/hive/hive_models/exam_attempt_hive_model.dart';

class HiveSetup {
  static Future<void> init() async {
    // 1. Init Hive
    await Hive.initFlutter();

    // 2. Register Adapters
    Hive.registerAdapter(ExamAttemptModelAdapter());
    Hive.registerAdapter(QuestionWithAnswerModelAdapter());

    // 3. Open Boxes
    await Hive.openBox<ExamAttemptModel>('exam_attempts');
  }
}
