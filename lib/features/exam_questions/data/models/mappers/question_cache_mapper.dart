import 'package:exam_app/features/exam_questions/data/models/question_cache_model.dart';
import 'package:exam_app/features/exam_questions/domain/entities/question.dart';

class QuestionCacheMapper {
  // Entity → CacheModel
  static QuestionCacheModel fromEntity(Question q) {
    return QuestionCacheModel(
      id: q.id,
      question: q.question,
      correctKey: q.correctKey,
      selectedKey: q.selectedKey,
      selectedKeyList: q.selectedKeyList?.whereType<String>().toList(),
    );
  }

  // CacheModel → Entity
  static Question toEntity(QuestionCacheModel model) {
    return Question(
      id: model.id,
      question: model.question,
      correctKey: model.correctKey,
      selectedKey: model.selectedKey,
      selectedKeyList: model.selectedKeyList,
    );
  }

  // CacheModel → Map (for Hive)
  static Map<String, dynamic> toMap(QuestionCacheModel model) {
    return {
      "id": model.id,
      "question": model.question,
      "correctKey": model.correctKey,
      "selectedKey": model.selectedKey,
      "selectedKeyList": model.selectedKeyList,
    };
  }

  // Map → CacheModel
  static QuestionCacheModel fromMap(Map data) {
    return QuestionCacheModel(
      id: data["id"],
      question: data["question"],
      correctKey: data["correctKey"],
      selectedKey: data["selectedKey"],
      selectedKeyList: List<String>.from(data["selectedKeyList"] ?? []),
    );
  }
}
