import 'package:exam_app/features/results/api/data_source/results_local_data_source_impl.dart';
import 'package:exam_app/features/results/domain/entities/exam_attempt_entity.dart';
import 'package:exam_app/features/results/domain/repositories/results_repo.dart';
import 'package:injectable/injectable.dart';
import '../models/mappers/results_hive_mapper.dart';

@Injectable(as: ResultsRepository)
class ResultsRepositoryImpl implements ResultsRepository {
  final ResultsLocalDataSourceImpl localDataSource;

  ResultsRepositoryImpl(this.localDataSource);

  @override
  Future<void> saveAttempt(ExamAttempt entity) async {
    final model = ResultsHiveMapper.toHive(entity);
    await localDataSource.saveAttempt(model);
  }

  @override
  Future<List<ExamAttempt>> getAttempts() async {
    final models = await localDataSource.getAttempts();
    return models.map(ResultsHiveMapper.fromHive).toList();
  }
}
