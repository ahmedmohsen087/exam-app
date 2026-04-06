
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/config/secure_storage/secure_storage_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/subjects_models.dart';
import '../../../domain/use_cases/get_all_subjects_use_cases.dart';
import '../states/home_screen_state.dart';

@injectable
class HomeScreenViewModel extends Cubit <HomeScreenState>{

  HomeScreenViewModel(this.getAllSubjectsUseCases) : super(HomeScreenState());

  final GetAllSubjectsUseCases getAllSubjectsUseCases;

  Future<void> getAllSubjects() async {
    emit(state.copyWith(
        isLoadingSubjects: true,
        ));

    try {
      final token = await SecureStorageService.readToken();
      final subjects = await getAllSubjectsUseCases(token: token);

      if (subjects is Success<List<SubjectsModels>>) {
        emit(state.copyWith(
          isLoadingSubjects: false,
          subjectsList: subjects.data ?? [],
        ));
      } else if (subjects is Failed<List<SubjectsModels>>) {
        emit(state.copyWith(
          isLoadingSubjects: false,
          errorMessage: subjects.msg,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isLoadingSubjects: false,
        errorMessage: e.toString(),
      ));
    }
  }

  void onSearchChanged(String query) {
    List<SubjectsModels> filteredList = [];

    if (query.isEmpty) {
      filteredList = state.subjectsList;
    } else {
      filteredList = state.subjectsList.where((subject) {
        return subject.name
            .toLowerCase()
            .contains(query.toLowerCase());
      }).toList();
    }

    emit(state.copyWith(
      searchQuery: query,
      searchSubjectModels: filteredList,
    ));
  }


      }

