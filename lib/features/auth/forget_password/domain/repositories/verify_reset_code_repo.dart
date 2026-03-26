import 'package:exam_app/config/base_response/base_response.dart';
import '../entities/verify_reset_code_entity.dart';

abstract class VerifyResetCodeRepo {
  Future<BaseResponse<VerifyResetCodeEntity>> verifyResetCode(String resetCode);
}
