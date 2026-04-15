import 'package:exam_app/features/profile/domain/entities/profile_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_profile_dto.g.dart';

@JsonSerializable()
class UserProfileDto {
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
  DateTime? createdAt;

  UserProfileDto({
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

  ProfileModels toDomain() => ProfileModels(
    id: id ?? '',
    username: username ?? '',
    firstName: firstName ?? '',
    lastName: lastName ?? '',
    email: email ?? '',
    phone: phone ?? '',
    role: role ?? '',
    isVerified: isVerified ?? false,
    createdAt: createdAt ?? DateTime.now(),
  );

  factory UserProfileDto.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileDtoToJson(this);
}
