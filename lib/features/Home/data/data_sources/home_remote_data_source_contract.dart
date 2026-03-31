


import '../models/subject_dto.dart';

abstract class HomeRemoteDataSourceContract {

  Future<List<SubjectDto>> getAllSubjects();

}