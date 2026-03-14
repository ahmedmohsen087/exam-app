import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/forget_password/data/data_sources/forgot_password/forgot_password_remote_data_source.dart';
import 'package:exam_app/features/auth/forget_password/data/models/response/forgot_password_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/forgot_password_entity.dart';
import 'package:exam_app/features/auth/forget_password/domain/repositories/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPasswordRepo)
class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  final ForgotPasswordRemoteDataSource forgotPasswordRemoteDataSource;

  ForgetPasswordRepoImpl(this.forgotPasswordRemoteDataSource);

  @override
  Future<BaseResponse<ForgotPasswordEntity>> forgotPassword(
    String email,
  ) async {
    final response = await forgotPasswordRemoteDataSource.forgotPassword(
      email: email,
    );

    if (response is Success<ForgotPasswordResponse>) {
      return Success<ForgotPasswordEntity>(
        data: response.data.toForgotPasswordEntity(),
      );
    } else if (response is Failed<ForgotPasswordResponse>) {
      return Failed<ForgotPasswordEntity>(msg: response.msg);
    } else {
      return Failed<ForgotPasswordEntity>(msg: "Unknown error");
    }
  }
}
