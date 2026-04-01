
import 'package:exam_app/config/secure_storage/secure_storage_service.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/subjects_models.dart';
import '../../../domain/use_cases/get_all_subjects_use_cases.dart';

@injectable
class HomeScreenViewModel {

  HomeScreenViewModel(this.getAllSubjectsUseCases);

  final GetAllSubjectsUseCases getAllSubjectsUseCases;

  Future<void> getAllSubjects() async {

    final token = await SecureStorageService.readToken();


    List<SubjectsModels> subjects = await getAllSubjectsUseCases.call();

    print('Subjects:');

    for (var subject in subjects) {
      print(subject.name);
      print(subject.id);
      print('----------------');
    }
  }
}