


import 'package:exam_app/config/base_response/base_response.dart';

import '../models/user_profile_dto.dart';


abstract class ProfileRemoteDataSourceContract {

  Future<BaseResponse<List<UserProfileDto>>> getProfileData(
      {String ?token});

}