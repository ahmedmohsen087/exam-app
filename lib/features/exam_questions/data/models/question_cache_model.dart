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

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "question": question,
      "correctKey": correctKey,
      "selectedKey": selectedKey,
      "selectedKeyList": selectedKeyList,
    };
  }

  factory QuestionCacheModel.fromJson(Map<String, dynamic> json) {
    return QuestionCacheModel(
      id: json["id"],
      question: json["question"],
      correctKey: json["correctKey"],
      selectedKey: json["selectedKey"],
      selectedKeyList: List<String>.from(json["selectedKeyList"] ?? []),
    );
  }
}
