import 'package:exam_app/features/results/domain/entities/exam_attempt_entity.dart';
import 'package:exam_app/features/results/domain/repositories/results_repo.dart';

import '../data_source/results_local_data_source.dart';
import '../models/mappers/results_mapper.dart';

class ExamRepositoryImpl implements ResultsRepository {
  final ExamLocalDataSource localDataSource;

  ExamRepositoryImpl(this.localDataSource);

  @override
  Future<void> saveAttempt(ExamAttempt entity) async {
    final model = ResultsMapper.toHive(entity);
    await localDataSource.saveAttempt(model);
  }

  @override
  Future<List<ExamAttempt>> getAttempts() async {
    final models = await localDataSource.getAttempts();
    return models.map(ResultsMapper.fromHive).toList();
  }
}
