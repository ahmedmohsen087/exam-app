import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/forget_password/data/data_sources/verify_reset_code/verify_reset_code_remote_data_source.dart';
import 'package:exam_app/features/auth/forget_password/data/models/response/verify_reset_code_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/verify_reset_code_entity.dart';
import 'package:exam_app/features/auth/forget_password/domain/repositories/verify_reset_code_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: VerifyResetCodeRepo)
class VerifyResetCodeRepoImpl implements VerifyResetCodeRepo {
  final VerifyResetCodeRemoteDataSource remoteDataSource;

  VerifyResetCodeRepoImpl(this.remoteDataSource);

  @override
  Future<BaseResponse<VerifyResetCodeEntity>> verifyResetCode(
    String code,
  ) async {
    final response = await remoteDataSource.verifyResetCode(resetCode: code);

    if (response is Success<VerifyResetCodeResponse>) {
      return Success<VerifyResetCodeEntity>(
        data: response.data?.toVerifyResetCodeEntity(),
      );
    } else if (response is Failed<VerifyResetCodeResponse>) {
      return Failed<VerifyResetCodeEntity>(msg: response.msg);
    } else {
      return Failed<VerifyResetCodeEntity>(msg: "Unknown error");
    }
  }
}
