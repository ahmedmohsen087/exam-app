class QuestionCacheModel {
  final String? id;
  final String? question;
  final String? correctKey;

  final String? selectedKey;
  final List<String>? selectedKeyList;

  QuestionCacheModel({
    this.id,
    this.question,
    this.correctKey,
    this.selectedKey,
    this.selectedKeyList,
  });
}
