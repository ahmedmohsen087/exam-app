import 'package:exam_app/features/auth/sign_up/data/models/user_dto.dart';
import 'package:json_annotation/json_annotation.dart';


part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "token")
  String? token;

  @JsonKey(name: "user")
  UserDto? user;

  SignUpResponse({
    this.message,
    this.token,
    this.user,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}
