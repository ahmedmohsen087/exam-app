import 'package:exam_app/features/exam_questions/data/data_sources/questions_local_data_source.dart';
import 'package:exam_app/features/exam_questions/data/models/mappers/question_cache_mapper.dart';
import 'package:exam_app/features/exam_questions/domain/entities/question.dart';
import 'package:hive_ce_flutter/adapters.dart';

class QuestionsLocalDataSourceImpl implements QuestionsLocalDataSource {
  final Box<List<dynamic>> box;

  QuestionsLocalDataSourceImpl(this.box);

  @override
  Future<void> cacheQuestions(
    List<Question> questions,
    String examId,
  ) async {
    final cachedList = questions
        .map((q) => QuestionCacheMapper.toMap(
              QuestionCacheMapper.fromEntity(q),
            ))
        .toList();

    await box.put(examId, cachedList);
  }

  @override
  Future<List<Question>> getCachedQuestions(String examId) async {
    final data = box.get(examId);

    if (data == null || data is! List) return [];

    final list = data.cast<Map<String, dynamic>>();

    return list
        .map((e) => QuestionCacheMapper.fromMap(e))
        .map(QuestionCacheMapper.toEntity)
        .toList();
  }
}
