import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/config/secure_storage/secure_storage_service.dart';
import 'package:exam_app/features/auth/sign_in/api/client/sign_in_client.dart';
import 'package:exam_app/features/auth/sign_in/data/data_sources/sign_in_remote_data_source.dart';
import 'package:exam_app/features/auth/sign_in/data/models/user_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignInRemoteDataSource)
class SignInRemoteDataSourceImp extends SignInRemoteDataSource {
  SignInRemoteDataSourceImp(this._signInClient);

  final SignInClient _signInClient;

  @override
  Future<BaseResponse<UserDTO>> singIn(String email, String password) async {
    try {
      var signInResponse = await _signInClient.signIn(email, password);
      await SecureStorageService.writeToken(signInResponse.token);
      return Success<UserDTO>(data: signInResponse.user);
    } catch (e) {
      return Failed<UserDTO>(error: e);
    }
  }
}
