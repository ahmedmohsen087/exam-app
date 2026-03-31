
import 'package:injectable/injectable.dart';

import '../../../domain/entities/subjects_models.dart';
import '../../../domain/use_cases/get_all_subjects_use_cases.dart';

@injectable
class HomeScreenViewModel {

  HomeScreenViewModel(this.getAllSubjectsUseCases);

  final GetAllSubjectsUseCases getAllSubjectsUseCases;

  Future<void> getAllSubjects() async {
    List<SubjectsModels> subjects = await getAllSubjectsUseCases();

    subjects.forEach((subject) {
      print(subject.name);
      print(subject.id);
      print('----------------');
    });



  }
}