import 'package:exam_app/features/profile/data/models/user_profile_dto.dart';
import 'package:exam_app/features/profile/domain/entities/profile_models.dart';
import 'package:exam_app/features/profile/domain/repo/profile_repo_contract.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../data_source/profile_remote_data_source_contract.dart';
@Injectable(as: ProfileRepoContract)
class ProfileRepoImpl  implements ProfileRepoContract{

  final ProfileRemoteDataSourceContract profileRemoteDataSourceContract;

  ProfileRepoImpl(this.profileRemoteDataSourceContract);


  @override
  Future<BaseResponse<ProfileModels>> getProfileData({String ? token,}) async {
    final response = await profileRemoteDataSourceContract.getProfileData(
      token: token,
    );
    switch (response){
      case Success<UserProfileDto>():
        return Success<ProfileModels>(data: response.data?.toDomain());
      case Failed<UserProfileDto>():
        return Failed<ProfileModels>(error: response.error);

    }


  }
}