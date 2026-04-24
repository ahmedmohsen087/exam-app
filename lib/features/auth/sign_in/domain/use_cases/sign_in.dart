import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/sign_in/domain/entities/user.dart';
import 'package:exam_app/features/auth/sign_in/domain/repositories/sign_in_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInUseCase {
  SignInUseCase(this._signInRepo);
  final SignInRepo _signInRepo;

  Future<BaseResponse<User>> call(String email, String password) async {
    var response = await _signInRepo.signIn(email, password);
    switch (response) {
      case Success<User>():
        return Success<User>(data: response.data);
      case Failed<User>():
        return Failed<User>(msg: response.msg);
    }
  }
}
