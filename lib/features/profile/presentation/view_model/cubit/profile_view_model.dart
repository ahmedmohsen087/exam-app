
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/config/secure_storage/secure_storage_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/entities/edit_profile_models.dart';
import '../../../domain/entities/edit_profile_request.dart';
import '../../../domain/entities/profile_models.dart';
import '../../../domain/use_cases/get_profile_use_cases.dart';
import '../states/profile_state.dart';

@injectable
class ProfileViewModel extends Cubit <ProfileScreenState>{

  ProfileViewModel(this.getProfileUseCases) : super(ProfileScreenState());

  final GetProfileUseCases getProfileUseCases;

  Future<void> getUserData() async {
    emit(state.copyWith(
      isLoadingProfile: true,
      isUpdateSuccess: false,
    ));

    try {
      final token = await SecureStorageService.readToken();
      final profileData = await getProfileUseCases(token: token);

      if (profileData is Success<ProfileModels>) {
        emit(state.copyWith(
          isLoadingProfile: false,
          profile: profileData.data,
          errorMessage: null,
        ));
      } else if (profileData is Failed<ProfileModels>) {
        emit(state.copyWith(
          isLoadingProfile: false,
          profile: null,
          errorMessage: profileData.msg,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
      isLoadingProfile: false,
        profile: null,
        errorMessage: e.toString(),
      ));
    }
  }
  Future<void> updateProfile({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  }) async {
    emit(state.copyWith(
      isUpdatingProfile: true,
      isUpdateSuccess: false,
      errorMessage: null,
    ));
    try {
      final profileData = await getProfileUseCases.updateProfile(
        request: EditProfileRequest(
          username: username,
          firstName: firstName,
          lastName: lastName,
          email: email,
          phone: phone,
        ),
      );

      if (profileData is Success<EditProfileModels>) {
        emit(state.copyWith(
          isUpdatingProfile: false,
          isUpdateSuccess: true,
          errorMessage: null,
          profile: _mergeUpdatedProfile(profileData.data),
        ));
      } else if (profileData is Failed<EditProfileModels>) {
        emit(state.copyWith(
          isUpdatingProfile: false,
          isUpdateSuccess: false,
          errorMessage: profileData.msg,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isUpdatingProfile: false,
        isUpdateSuccess: false,
        errorMessage: e.toString(),
      ));
    }
  }

  ProfileModels _mergeUpdatedProfile(EditProfileModels? updatedProfile) {
    final currentProfile = state.profile;

    return ProfileModels(
      id: updatedProfile?.id ?? currentProfile?.id ?? '',
      username: updatedProfile?.username ?? currentProfile?.username ?? '',
      firstName: updatedProfile?.firstName ?? currentProfile?.firstName ?? '',
      lastName: updatedProfile?.lastName ?? currentProfile?.lastName ?? '',
      email: updatedProfile?.email ?? currentProfile?.email ?? '',
      phone: updatedProfile?.phone ?? currentProfile?.phone ?? '',
      role: updatedProfile?.role ?? currentProfile?.role ?? '',
      isVerified:
          updatedProfile?.isVerified ?? currentProfile?.isVerified ?? false,
      createdAt:
          updatedProfile?.createdAt ?? currentProfile?.createdAt ?? DateTime.now(),
      passwordResetCode: currentProfile?.passwordResetCode ?? '',
      passwordResetExpires:
          currentProfile?.passwordResetExpires ?? DateTime.now(),
      resetCodeVerified: currentProfile?.resetCodeVerified ?? false,
    );
  }




}
