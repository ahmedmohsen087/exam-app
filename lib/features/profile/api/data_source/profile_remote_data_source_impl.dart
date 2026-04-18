
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../config/base_response/base_response.dart';
import '../../data/data_source/profile_remote_data_source_contract.dart';
import '../../data/models/user_profile_dto.dart';
import '../profile_api_client/profile_api_client.dart';

@Injectable(as: ProfileRemoteDataSourceContract)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSourceContract {
  final ProfileApiClient profileApiClient;

  ProfileRemoteDataSourceImpl(this.profileApiClient);

  @override
  Future<BaseResponse<UserProfileDto>> getProfileData({String? token}) async {
    try {
      final response = await profileApiClient.getProfileData(
        token: token,
      );

      if (response.user != null) {
        return Success<UserProfileDto>(data: response.user!);
      } else {
        return Failed<UserProfileDto>(error: 'No user data');
      }

    } catch (e) {
      if (e is DioException) {
        return Failed<UserProfileDto>(error: e);
      } else if (e is TimeoutException) {
        return Failed<UserProfileDto>(error: e);
      }
      return Failed<UserProfileDto>(error: e);
    }
  }
}
