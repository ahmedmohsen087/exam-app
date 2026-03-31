import '../entities/subjects_models.dart';

abstract class HomeRepoContract {

  Future <List<SubjectsModels>> getAllSubjects() ;

}