import 'package:json_annotation/json_annotation.dart';

import '../edit_profile_dto.dart';
part 'edit_profile_response.g.dart';


@JsonSerializable()
class EditProfileResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "user")
  EditProfileDto? user;

  EditProfileResponse({
    this.message,
    this.user,
  });

  factory EditProfileResponse.fromJson(Map<String, dynamic> json) => _$EditProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileResponseToJson(this);
}


