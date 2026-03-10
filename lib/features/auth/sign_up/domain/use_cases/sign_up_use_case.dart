import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/sign_up/domain/entities/user.dart';
import 'package:exam_app/features/auth/sign_up/domain/repositories/sign_up_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpUseCase {
  SignUpUseCase(this._signUpRepo);

  SignUpRepo _signUpRepo;

  Future<BaseResponse<User>> call({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) async {
    var response = await _signUpRepo.signUp(
      username,
      firstName,
      lastName,
      email,
      password,
      rePassword,
      phone,
    );

    switch (response) {
      case Success<User>():
        return Success<User>(data: response.data);
      case Failed<User>():
        return Failed<User>(msg: response.msg);
    }
  }
}
