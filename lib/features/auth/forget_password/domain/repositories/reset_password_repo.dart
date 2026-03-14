import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/reset_password_entity.dart';

abstract class ResetPasswordRepo {
  Future<BaseResponse<ResetPasswordEntity>> resetPassword({
    required String newPassword,
  });
}
