import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/sign_up/data/data_sources/sign_up_remote_data_source.dart';
import 'package:exam_app/features/auth/sign_up/data/models/user_dto.dart';
import 'package:exam_app/features/auth/sign_up/domain/entities/user.dart';
import 'package:exam_app/features/auth/sign_up/domain/repositories/sign_up_repo.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: SignUpRepo)
class SignUpRepoImp extends SignUpRepo {
  SignUpRepoImp(this._remoteDataSource);

  SignUpRemoteDataSource _remoteDataSource;


  @override
  Future<BaseResponse<User>> signUp(
    String username,
    String firstName,
    String lastName,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    var response = await _remoteDataSource.signUp(
      username,
      firstName,
      lastName,
      email,
      password,
      rePassword,
      phone,
    );

    switch (response) {
      case Success<UserDto>():
        return Success<User>(data: response.data?.toUserEntity());
      case Failed<UserDto>():
        return Failed<User>(msg: response.msg);
    }
  }
}
