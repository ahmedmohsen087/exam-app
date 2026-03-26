import 'package:exam_app/features/auth/forget_password/domain/entities/verify_reset_code_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_reset_code_response.g.dart';

@JsonSerializable()
class VerifyResetCodeResponse {
  @JsonKey(name: "status")
  final String? status;

  VerifyResetCodeResponse({this.status});

  factory VerifyResetCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyResetCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyResetCodeResponseToJson(this);

  VerifyResetCodeEntity toVerifyResetCodeEntity() {
    return VerifyResetCodeEntity(status: status);
  }
}
