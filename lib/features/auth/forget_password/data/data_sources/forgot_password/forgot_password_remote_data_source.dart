import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/forget_password/data/models/response/forgot_password_response.dart';

abstract class ForgotPasswordRemoteDataSource {
  Future<BaseResponse<ForgotPasswordResponse>> forgotPassword({
    required String email,
  });
}
