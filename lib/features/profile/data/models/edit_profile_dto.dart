import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/edit_profile_models.dart';
part 'edit_profile_dto.g.dart';

@JsonSerializable()
class EditProfileDto {
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
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "isVerified")
  bool? isVerified;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;

  EditProfileDto({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.password,
    this.isVerified,
    this.createdAt,
  });

  EditProfileModels toDomain() => EditProfileModels(
    id: id ?? '',
    username: username ?? '',
    firstName: firstName ?? '',
    lastName: lastName ?? '',
    email: email ?? '',
    phone: phone ?? '',
    role: role ?? '',
    password: password ?? '',
    isVerified: isVerified ?? false,
    createdAt: createdAt ?? DateTime.now(),
  );

  factory EditProfileDto.fromJson(Map<String, dynamic> json) => _$EditProfileDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileDtoToJson(this);
}