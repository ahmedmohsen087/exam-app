import 'package:exam_app/features/profile/domain/entities/profile_models.dart';


class ProfileScreenState {
  static const Object _empty = Object();

  bool isLoadingProfile = true;
  ProfileModels? profile;
  String? errorMessage;


  ProfileScreenState({
    this.isLoadingProfile = true,
    this.profile,
    this.errorMessage,

  });

  ProfileScreenState copyWith({
    bool? isLoadingProfile,
    Object? profile = _empty,
    Object? errorMessage = _empty,

  })
  {
    return ProfileScreenState(
      isLoadingProfile: isLoadingProfile ?? this.isLoadingProfile,
      profile: identical(profile, _empty) ? this.profile : profile as ProfileModels?,
      errorMessage: identical(errorMessage, _empty)
          ? this.errorMessage
          : errorMessage as String?,

    );
  }



}


