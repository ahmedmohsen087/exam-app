import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/verify_reset_code_entity.dart';
import 'package:exam_app/features/auth/forget_password/domain/repositories/verify_reset_code_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyResetCodeUseCase {
  final VerifyResetCodeRepo _verifyResetCodeRepo;

  VerifyResetCodeUseCase(this._verifyResetCodeRepo);

  Future<BaseResponse<VerifyResetCodeEntity>> call({
    required String resetCode,
  }) async {
    final response = await _verifyResetCodeRepo.verifyResetCode(resetCode);

    switch (response) {
      case Success<VerifyResetCodeEntity>():
        return Success<VerifyResetCodeEntity>(data: response.data);

      case Failed<VerifyResetCodeEntity>():
        return Failed<VerifyResetCodeEntity>(msg: response.msg);
    }
  }
}
