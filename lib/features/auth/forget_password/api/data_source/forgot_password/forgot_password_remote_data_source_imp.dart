import 'package:dio/dio.dart';
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/forget_password/api/client/forget_password_client.dart';
import 'package:exam_app/features/auth/forget_password/data/data_sources/forgot_password/forgot_password_remote_data_source.dart';
import 'package:exam_app/features/auth/forget_password/data/models/response/forgot_password_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgotPasswordRemoteDataSource)
class ForgotPasswordRemoteDataSourceImp
    implements ForgotPasswordRemoteDataSource {
  final ForgetPasswordClient forgetPasswordClient;

  ForgotPasswordRemoteDataSourceImp(this.forgetPasswordClient);

  @override
  Future<BaseResponse<ForgotPasswordResponse>> forgotPassword({
    required String email,
  }) async {
    try {
      final response = await forgetPasswordClient.forgotPassword({
        'email': email,
      });
      return Success<ForgotPasswordResponse>(data: response);
    } catch(e){
      return Failed<ForgotPasswordResponse>(error: e);
    }
  }
}
