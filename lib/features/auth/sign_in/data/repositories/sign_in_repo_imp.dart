import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/sign_in/data/data_sources/sign_in_remote_data_source.dart';
import 'package:exam_app/features/auth/sign_in/data/models/user_dto.dart';
import 'package:exam_app/features/auth/sign_in/domain/entities/user.dart';
import 'package:exam_app/features/auth/sign_in/domain/repositories/sign_in_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignInRepo)
class SignInRepoImp extends SignInRepo {
  SignInRepoImp(this._signInRemoteDataSource);

  final SignInRemoteDataSource _signInRemoteDataSource;

  @override
  Future<BaseResponse<User>> signIn(String email, String password) async {
    var response = await _signInRemoteDataSource.singIn(email, password);
    switch (response) {
      case Success<UserDTO>():
        return Success<User>(data: response.data?.toUserEntity());
      case Failed<UserDTO>():
        return Failed<User>(msg: response.msg);
    }
  }
}
