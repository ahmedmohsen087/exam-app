import 'package:exam_app/config/hive/hive_model/models/exam_attempt_hive_model.dart';
import 'package:exam_app/features/results/data/data_source/results_local_data_source.dart';
import 'package:hive_ce/hive.dart';

class ResultsLocalDataSourceImpl implements ResultsLocalDataSource {
  final Box<ExamAttemptModel> box;

  ResultsLocalDataSourceImpl(this.box);

  @override
  Future<void> saveAttempt(ExamAttemptModel model) async {
    await box.put(model.examId, model);
  }

  @override
  Future<List<ExamAttemptModel>> getAttempts() async {
    return box.values.toList();
  }
}
