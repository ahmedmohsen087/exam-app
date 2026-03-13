import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/forgot_password_entity.dart';

abstract class ForgetPasswordRepo {
  Future<BaseResponse<ForgotPasswordEntity>> forgotPassword(String email);
}
