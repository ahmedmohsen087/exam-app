import 'package:exam_app/features/profile/domain/entities/profile_models.dart';

import '../../../../config/base_response/base_response.dart';

abstract class ProfileRepoContract {
  Future <BaseResponse<ProfileModels>> getProfileData({String? token,}) ;

}