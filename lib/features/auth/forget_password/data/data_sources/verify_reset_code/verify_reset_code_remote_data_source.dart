import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/forget_password/data/models/response/verify_reset_code_response.dart';

abstract class VerifyResetCodeRemoteDataSource {
  Future<BaseResponse<VerifyResetCodeResponse>> verifyResetCode({
    required String resetCode,
  });
}
