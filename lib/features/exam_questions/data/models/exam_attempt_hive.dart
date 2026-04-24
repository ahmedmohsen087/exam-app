import 'package:hive_ce_flutter/adapters.dart';

part 'exam_attempt_hive.g.dart';

@HiveType(typeId: 1)
class ExamAttemptHiveModel extends HiveObject {
  @HiveField(0)
  late String examId;

  @HiveField(1)
  late int correct;

  @HiveField(2)
  late int incorrect;

  @HiveField(3)
  late DateTime submittedAt;
}
