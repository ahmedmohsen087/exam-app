


import 'package:exam_app/config/base_response/base_response.dart';

import '../models/edit_profile_dto.dart';
import '../models/response/edit_profile_response.dart';
import '../models/user_profile_dto.dart';


abstract class ProfileRemoteDataSourceContract {

  Future<BaseResponse<UserProfileDto>> getProfileData(
      {String ?token});


  Future<BaseResponse<EditProfileDto>> updateProfile({
    required EditProfileResponse request,
  });


}