import 'package:dio/dio.dart';
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/config/secure_storage/secure_storage_service.dart';
import 'package:exam_app/features/auth/sign_up/api/client/sign_up_client.dart';
import 'package:exam_app/features/auth/sign_up/data/data_sources/sign_up_remote_data_source.dart';
import 'package:exam_app/features/auth/sign_up/data/models/user_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignUpRemoteDataSource)
class SignUpRemoteDataSourceImp extends SignUpRemoteDataSource {
  SignUpRemoteDataSourceImp(this._signUpClient);

  SignUpClient _signUpClient;

  @override
  Future<BaseResponse<UserDto>> signUp(
    String username,
    String firstName,
    String lastName,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    try {
      var response = await _signUpClient.signUp(
        username,
        firstName,
        lastName,
        email,
        password,
        rePassword,
        phone,
      );
      await SecureStorageService.writeToken(response.token);
      return Success<UserDto>(data: response.user);
    } on DioException catch (e) {
      return Failed<UserDto>(msg: e.response?.data["message"]);
    } catch (e) {
      return Failed<UserDto>(msg: "Some Thing Went Wrong");
    }
  }
}
