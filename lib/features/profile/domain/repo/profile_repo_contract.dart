import 'package:exam_app/features/profile/domain/entities/profile_models.dart';

import '../../../../config/base_response/base_response.dart';
import '../entities/edit_profile_request.dart';
import '../entities/edit_profile_models.dart';

abstract class ProfileRepoContract {
  Future <BaseResponse<ProfileModels>> getProfileData({String? token,}) ;
  Future<BaseResponse<EditProfileModels>> updateProfile({
    required EditProfileRequest request,
  });

}
