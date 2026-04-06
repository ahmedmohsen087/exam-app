import '../../../domain/entities/subjects_models.dart';

class HomeScreenState {
  bool isLoadingSubjects = true;
  List<SubjectsModels> subjectsList = [];
  String? errorMessage;
  String searchQuery = '';
  List<SubjectsModels> searchSubjectModels = [];

  HomeScreenState({
     this.isLoadingSubjects = true,
     this.subjectsList = const [],
     this.errorMessage,
     this.searchQuery = '',
     this.searchSubjectModels = const [],
  });

  HomeScreenState copyWith({
    bool? isLoadingSubjects,
    List<SubjectsModels>? subjectsList,
    String? errorMessage,
    String? searchQuery,
    List<SubjectsModels>? searchSubjectModels,
  })
  {
    return HomeScreenState(
      isLoadingSubjects: isLoadingSubjects ?? this.isLoadingSubjects,
      subjectsList: subjectsList ?? this.subjectsList,
      errorMessage: errorMessage ?? this.errorMessage,
      searchQuery: searchQuery ?? this.searchQuery,
      searchSubjectModels: searchSubjectModels ?? this.searchSubjectModels,
    );
  }



}




