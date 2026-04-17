import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../../core/values/arg_param.dart';
import '../../../../core/values/endpoints.dart';
import '../../data/models/response/profile_response.dart';

part 'profile_api_client.g.dart';
@injectable
@RestApi()
abstract class ProfileApiClient {
  @factoryMethod
  factory ProfileApiClient(Dio dio,) = _ProfileApiClient;

  @GET(Endpoints.profileData)
  Future<ProfileResponse> getProfileData({
    @Header(ArgParam.token) String? token,
  }
      );
}