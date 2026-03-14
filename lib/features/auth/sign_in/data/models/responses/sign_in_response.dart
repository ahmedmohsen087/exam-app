
import 'package:json_annotation/json_annotation.dart';
import '../user_dto.dart';

part 'sign_in_response.g.dart';

@JsonSerializable()
class SignInResponse {

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "token")
  String? token;

  @JsonKey(name: "user")
  UserDTO? user;

  SignInResponse({
    this.message,
    this.token,
    this.user,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json)
      => _$SignInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);
}
