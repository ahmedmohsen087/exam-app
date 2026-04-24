import 'package:exam_app/features/auth/sign_up/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
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

  @JsonKey(name: "_id")
  String? id;

  @JsonKey(name: "createdAt")
  String? createdAt;

  UserDto({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.id,
    this.createdAt,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  User toUserEntity() {
    return User(
      id: this.id,
      firstName: this.firstName,
      lastName: this.lastName,
      role: this.role,
      createdAt: this.createdAt,
      phone: this.phone,
      email: this.email,
      username: this.username,
      isVerified: this.isVerified,
    );
  }
}
