import 'package:dio/dio.dart';
import 'package:exam_app/core/values/endpoints.dart';
import 'package:exam_app/features/auth/sign_in/data/models/responses/sign_in_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'sign_in_client.g.dart';

@injectable
@RestApi(baseUrl: Endpoints.baseUrl)
abstract class SignInClient {
  @factoryMethod
  factory SignInClient(Dio dio) = _SignInClient;

  @POST(Endpoints.signIn)
  Future<SignInResponse> signIn(
    @Field("email") String email,
    @Field("password") String password,
  );

}
