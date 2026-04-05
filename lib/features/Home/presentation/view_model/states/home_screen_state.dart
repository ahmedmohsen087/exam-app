import '../../../domain/entities/subjects_models.dart';

sealed class HomeScreenState {}

class HomeInitialState extends HomeScreenState {}

class HomeLoadingState extends HomeScreenState {}

class HomeSuccessState extends HomeScreenState {
  final List<SubjectsModels> subjects;
  HomeSuccessState(this.subjects);
}

class HomeErrorState extends HomeScreenState {
  final String error;
  HomeErrorState(this.error);
}


