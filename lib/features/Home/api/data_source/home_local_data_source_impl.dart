

import 'package:exam_app/features/Home/data/models/subject_dto.dart';

import '../../data/data_sources/home_local_data_source_contract.dart';

class HomeLocalDataSourceImpl implements HomeLocalDataSourceContract {
  @override
  Future<List<SubjectDto>> getAllSubjects() {
    throw UnimplementedError();
  }


}