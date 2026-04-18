


import 'package:exam_app/config/base_response/base_response.dart';

import '../models/subject_dto.dart';

abstract class HomeRemoteDataSourceContract {

  Future<BaseResponse<List<SubjectDto>>> getAllSubjects(
  {String ?token});

}