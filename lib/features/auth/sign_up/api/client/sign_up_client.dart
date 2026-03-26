import 'package:dio/dio.dart';
import 'package:exam_app/core/values/endpoints.dart';
import 'package:exam_app/features/auth/sign_up/data/models/responses/sign_up_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'sign_up_client.g.dart';

@injectable
@RestApi(baseUrl: Endpoints.signUp)
abstract class SignUpClient {
  @factoryMethod
  factory SignUpClient(Dio dio) = _SignUpClient;

  @POST(Endpoints.signUp)
  Future<SignUpResponse> signUp(
    @Field("username") String username,
    @Field("firstName") String firstName,
    @Field("lastName") String lastName,
    @Field("email") String email,
    @Field("password") String password,
    @Field("rePassword") String rePassword,
    @Field("phone") String phone,
  );
}
