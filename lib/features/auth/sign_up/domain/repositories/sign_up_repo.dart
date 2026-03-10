import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/sign_up/domain/entities/user.dart';

abstract class SignUpRepo {
  Future<BaseResponse<User>> signUp(
    String username,
    String firstName,
    String lastName,
    String email,
    String password,
    String rePassword,
    String phone,
  );
}
