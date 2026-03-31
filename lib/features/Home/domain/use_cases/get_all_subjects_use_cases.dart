
import 'package:injectable/injectable.dart';

import '../entities/subjects_models.dart';
import '../repo/home_repo_contract.dart';
@injectable
class GetAllSubjectsUseCases {

  final HomeRepoContract homeRepoContract;

  GetAllSubjectsUseCases(this.homeRepoContract);


Future<List<SubjectsModels>> call () async {
  return  await homeRepoContract.getAllSubjects();
}
}