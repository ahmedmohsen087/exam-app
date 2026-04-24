import 'package:dio/dio.dart';
import 'package:exam_app/core/values/endpoints.dart';
import 'package:exam_app/features/auth/forget_password/data/models/response/forgot_password_response.dart';
import 'package:exam_app/features/auth/forget_password/data/models/response/reset_password_response.dart';
import 'package:exam_app/features/auth/forget_password/data/models/response/verify_reset_code_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'forget_password_client.g.dart';

@injectable
@RestApi(baseUrl: Endpoints.baseUrl)
abstract class ForgetPasswordClient {
  @factoryMethod
  factory ForgetPasswordClient(Dio dio) = _ForgetPasswordClient;

  @POST(Endpoints.forgotPassword)
  Future<ForgotPasswordResponse> forgotPassword(
    @Body() Map<String, dynamic> body,
  );

  @POST(Endpoints.verifyResetCode)
  Future<VerifyResetCodeResponse> verifyResetCode(
    @Body() Map<String, dynamic> body,
  );

  @PUT(Endpoints.resetPassword)
  Future<ResetPasswordResponse> resetPassword(
    @Body() Map<String, dynamic> body,
  );
}
