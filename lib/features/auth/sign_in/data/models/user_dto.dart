import 'package:exam_app/features/auth/sign_in/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDTO {
  @JsonKey(name: "_id")
  String? id;

  @JsonKey(name: "username")
  String? username;

  @JsonKey(name: "firstName")
  String? firstName;

  @JsonKey(name: "lastName")
  String? lastName;

  @JsonKey(name: "email")
  String? email;

  @JsonKey(name: "phone")
  String? phone;

  @JsonKey(name: "role")
  String? role;

  @JsonKey(name: "isVerified")
  bool? isVerified;

  @JsonKey(name: "createdAt")
  String? createdAt;

  UserDTO({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.createdAt,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);

  User toUserEntity() {
    return User(
      id: id,
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      role: role,
      isVerified: isVerified,
      createdAt: createdAt,
    );
  }
}
