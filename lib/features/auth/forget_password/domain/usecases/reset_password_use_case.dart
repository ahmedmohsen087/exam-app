import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/reset_password_entity.dart';
import 'package:exam_app/features/auth/forget_password/domain/repositories/reset_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUseCase {
  final ResetPasswordRepo _repo;

  ResetPasswordUseCase(this._repo);

  Future<BaseResponse<ResetPasswordEntity>> call({
    required String newPassword,
  }) async {
    final response = await _repo.resetPassword(newPassword: newPassword);

    if (response is Success<ResetPasswordEntity>) {
      return Success<ResetPasswordEntity>(data: response.data);
    } else if (response is Failed<ResetPasswordEntity>) {
      return Failed<ResetPasswordEntity>(msg: response.msg);
    } else {
      return Failed<ResetPasswordEntity>(msg: "Unknown error");
    }
  }
}
