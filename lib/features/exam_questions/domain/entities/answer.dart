class Answer {
  String? answer;
  String? key;
  bool isSelected;

  Answer({
    this.answer,
    this.key,
    this.isSelected=false
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
    answer: json["answer"],
    key: json["key"],
  );

  Map<String, dynamic> toJson() => {
    "answer": answer,
    "key": key,
  };
}