import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/forget_password/data/data_sources/reset_password/reset_password_remote_data_source.dart';
import 'package:exam_app/features/auth/forget_password/data/models/response/reset_password_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/reset_password_entity.dart';
import 'package:exam_app/features/auth/forget_password/domain/repositories/reset_password_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ResetPasswordRepo)
class ResetPasswordRepoImpl implements ResetPasswordRepo {
  final ResetPasswordRemoteDataSource remoteDataSource;

  ResetPasswordRepoImpl(this.remoteDataSource);

  @override
  Future<BaseResponse<ResetPasswordEntity>> resetPassword({
    required String newPassword,
  }) async {
    final response = await remoteDataSource.resetPassword(
      newPassword: newPassword,
    );

    if (response is Success<ResetPasswordResponse>) {
      return Success<ResetPasswordEntity>(
        data: response.data?.toResetPasswordEntity(),
      );
    } else if (response is Failed<ResetPasswordResponse>) {
      return Failed<ResetPasswordEntity>(msg: response.msg);
    } else {
      return Failed<ResetPasswordEntity>(msg: "Unknown error");
    }
  }
}
