
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/config/secure_storage/secure_storage_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/subjects_models.dart';
import '../../../domain/use_cases/get_all_subjects_use_cases.dart';
import '../states/home_screen_state.dart';

@injectable
class HomeScreenViewModel extends Cubit <HomeScreenState>{

  HomeScreenViewModel(this.getAllSubjectsUseCases) : super(HomeInitialState());

  final GetAllSubjectsUseCases getAllSubjectsUseCases;

  Future<void> getAllSubjects() async {
    emit(HomeLoadingState());
    final token = await SecureStorageService.readToken();
    print(token);
   final subjects = await getAllSubjectsUseCases(token: token);

    print('Subjects: $subjects');

    switch (subjects) {
      case Success<List<SubjectsModels>>():
        print(subjects.data);
        emit(HomeSuccessState(subjects.data ??[] ));
        break;
      case Failed<List<SubjectsModels>>():
        print(subjects.error);
        emit(HomeErrorState(subjects.error.toString()));
        break;
    }
  }
}