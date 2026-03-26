import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/forget_password/api/client/forget_password_client.dart';
import 'package:exam_app/features/auth/forget_password/data/data_sources/verify_reset_code/verify_reset_code_remote_data_source.dart';
import 'package:exam_app/features/auth/forget_password/data/models/response/verify_reset_code_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: VerifyResetCodeRemoteDataSource)
class VerifyResetCodeRemoteDataSourceImp
    implements VerifyResetCodeRemoteDataSource {
  final ForgetPasswordClient forgetPasswordClient;

  VerifyResetCodeRemoteDataSourceImp(this.forgetPasswordClient);

  @override
  Future<BaseResponse<VerifyResetCodeResponse>> verifyResetCode({
    required String resetCode,
  }) async {
    try {
      var response = await forgetPasswordClient.verifyResetCode({
        "resetCode": resetCode,
      });

      return Success<VerifyResetCodeResponse>(data: response);
    } catch (e) {
      return Failed<VerifyResetCodeResponse>(error: e);
    }
  }
}
