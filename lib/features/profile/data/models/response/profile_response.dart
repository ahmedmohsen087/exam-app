import 'package:json_annotation/json_annotation.dart';

import '../user_profile_dto.dart';
part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "user")
  UserProfileDto? user;
  ProfileResponse({
    this.message,
    this.user,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}


