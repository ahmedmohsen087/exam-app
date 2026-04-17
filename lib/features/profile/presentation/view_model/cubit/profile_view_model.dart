
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/config/secure_storage/secure_storage_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
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




}
