import 'package:exam_app/features/profile/domain/entities/profile_models.dart';

import '../../../../config/base_response/base_response.dart';
import '../../data/models/response/edit_profile_response.dart';
import '../entities/edit_profile_models.dart';

abstract class ProfileRepoContract {
  Future <BaseResponse<ProfileModels>> getProfileData({String? token,}) ;
  Future<BaseResponse<EditProfileModels>> updateProfile({
    required EditProfileResponse request,
  });

}