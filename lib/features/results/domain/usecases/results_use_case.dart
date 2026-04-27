import 'package:exam_app/features/results/domain/repositories/results_repo.dart';
import 'package:injectable/injectable.dart';
import '../entities/exam_attempt_entity.dart';

@injectable
class ResultsUseCase {
  final ResultsRepository repository;

  ResultsUseCase(this.repository);

  // Save attempt
  Future<void> saveAttempt(ExamAttempt attempt) async {
    await repository.saveAttempt(attempt);
  }

  // Get all attempts
  Future<List<ExamAttempt>> getAttempts() async {
    return await repository.getAttempts();
  }
}
