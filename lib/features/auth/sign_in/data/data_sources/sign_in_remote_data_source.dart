import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/sign_in/data/models/user_dto.dart';

abstract class SignInRemoteDataSource {
  Future<BaseResponse<UserDTO>> singIn(String email, String password);
}
