
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:injectable/injectable.dart';

import '../entities/subjects_models.dart';
import '../repo/home_repo_contract.dart';
@injectable
class GetAllSubjectsUseCases {

  final HomeRepoContract homeRepoContract;

  GetAllSubjectsUseCases(this.homeRepoContract);


Future<BaseResponse<List<SubjectsModels>>> call ({String? token}) async {
  return  await homeRepoContract.getAllSubjects(token: token);
}
}