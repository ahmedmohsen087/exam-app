import 'package:exam_app/features/profile/domain/entities/profile_models.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../repo/profile_repo_contract.dart';
@injectable
class GetProfileUseCases {

  final ProfileRepoContract profileRepoContract ;
  GetProfileUseCases(this.profileRepoContract);

  Future<BaseResponse<ProfileModels>> call ({String? token}) async {
    return  await profileRepoContract.getProfileData(token: token);
  }
}