import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/sign_up/data/models/user_dto.dart';

abstract class SignUpRemoteDataSource {
  Future<BaseResponse<UserDto>> signUp(
    String username,
    String firstName,
    String lastName,
    String email,
    String password,
    String rePassword,
    String phone,
  );
}
