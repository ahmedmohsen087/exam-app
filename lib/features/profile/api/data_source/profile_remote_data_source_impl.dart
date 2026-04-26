
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../config/base_response/base_response.dart';
import '../../../../config/secure_storage/secure_storage_service.dart';
import '../../data/data_source/profile_remote_data_source_contract.dart';
import '../../data/models/edit_profile_dto.dart';
import '../../data/models/edit_profile_request_dto.dart';
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

  @override
  Future<BaseResponse<EditProfileDto>> updateProfile({
    required EditProfileRequestDto request,
  }) async {
    try {
      final response = await profileApiClient.updateProfile(
        token: await SecureStorageService.readToken(),
        request: request,
      );

      final user = response.user;

      if (user != null) {
        return Success<EditProfileDto>(data: user);
      } else {
        return Failed<EditProfileDto>(error: 'No user data');
      }

    } on DioException catch (e) {
      return Failed<EditProfileDto>(
        error: e.response?.data['message'] ?? 'Server error',
      );
    } on TimeoutException {
      return Failed<EditProfileDto>(
        error: 'Request timeout',
      );
    } catch (e) {
      return Failed<EditProfileDto>(
        error: 'Unexpected error',
      );
    }
  }
}
