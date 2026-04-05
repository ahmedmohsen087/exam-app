import 'package:exam_app/config/base_response/base_response.dart';

import '../entities/subjects_models.dart';

abstract class HomeRepoContract {

  Future <BaseResponse<List<SubjectsModels>>> getAllSubjects({String? token,}) ;

}