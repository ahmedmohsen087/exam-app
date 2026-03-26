import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/forget_password/data/models/response/reset_password_response.dart';

abstract class ResetPasswordRemoteDataSource {
  Future<BaseResponse<ResetPasswordResponse>> resetPassword({
    required String newPassword,
    required String email
  });
}
