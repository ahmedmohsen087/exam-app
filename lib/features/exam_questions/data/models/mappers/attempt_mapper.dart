import 'package:exam_app/features/exam_questions/domain/entities/question.dart';
import 'package:exam_app/features/exam_questions/domain/entities/question_cache_model.dart';

extension QuestionToCache on Question {
  QuestionCacheModel toCacheModel() {
    return QuestionCacheModel(
      id: id,
      question: question,
      correctKey: correctKey,
      selectedKey: selectedKey,
      selectedKeyList: selectedKeyList?.whereType<String>().toList(),
    );
  }
}

extension CacheToEntityMapper on QuestionCacheModel {
  Question toEntity() {
    return Question(
      id: id,
      question: question,
      correctKey: correctKey,
      selectedKey: selectedKey,
      selectedKeyList: selectedKeyList,
    );
  }
}
