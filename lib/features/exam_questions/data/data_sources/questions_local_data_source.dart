import 'package:exam_app/features/exam_questions/domain/entities/question.dart';

abstract class QuestionsLocalDataSource {
  Future<void> cacheQuestions(List<Question> questions, String examId);

  Future<List<Question>> getCachedQuestions(String examId);
}
