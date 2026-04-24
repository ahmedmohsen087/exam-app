import 'package:exam_app/config/base_response/base_response.dart';

import '../entities/user.dart';

abstract class SignInRepo {
  Future<BaseResponse<User>> signIn(String email, String password);
}
