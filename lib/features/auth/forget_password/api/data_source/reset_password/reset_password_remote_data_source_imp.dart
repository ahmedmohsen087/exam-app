import 'package:dio/dio.dart';
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/features/auth/forget_password/api/client/forget_password_client.dart';
import 'package:exam_app/features/auth/forget_password/data/data_sources/reset_password/reset_password_remote_data_source.dart';
import 'package:exam_app/features/auth/forget_password/data/models/response/reset_password_response.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: ResetPasswordRemoteDataSource)
class ResetPasswordRemoteDataSourceImpl
    implements ResetPasswordRemoteDataSource {
  final ForgetPasswordClient client;

  ResetPasswordRemoteDataSourceImpl(this.client);

  @override
  Future<BaseResponse<ResetPasswordResponse>> resetPassword({
    required String newPassword,
    required String email
  }) async {
    try {

      final response = await client.resetPassword({
        'newPassword': newPassword,
        'email': email,
      });
      return Success<ResetPasswordResponse>(data: response);
    } on DioException catch (e) {
      return Failed<ResetPasswordResponse>(
        msg: e.response?.data['message'] ?? e.message,
      );
    } catch (e) {
      return Failed<ResetPasswordResponse>(msg: "Something went wrong");
    }
  }
}
