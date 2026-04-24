import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/forgot_password_entity.dart';
import 'package:exam_app/features/auth/forget_password/domain/repositories/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgotPasswordUseCase {
  final ForgetPasswordRepo _forgetPasswordRepo;

  ForgotPasswordUseCase(this._forgetPasswordRepo);

  Future<BaseResponse<ForgotPasswordEntity>> call({
    required String email,
  }) async {
    final response = await _forgetPasswordRepo.forgotPassword(email);

    if (response is Success<ForgotPasswordEntity>) {
      return Success<ForgotPasswordEntity>(data: response.data);
    } else if (response is Failed<ForgotPasswordEntity>) {
      return Failed<ForgotPasswordEntity>(msg: response.msg);
    } else {
      return Failed<ForgotPasswordEntity>(msg: "Unknown error");
    }
  }
}
