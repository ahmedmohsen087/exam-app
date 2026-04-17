

import 'package:dio/dio.dart';
import 'package:exam_app/features/Home/data/models/responses/subjects_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/values/arg_param.dart';
import '../../../../core/values/endpoints.dart';

part 'home_api_client.g.dart';
@injectable
@RestApi()
abstract class HomeApiClient {
  @factoryMethod
  factory HomeApiClient(Dio dio,) = _HomeApiClient;

  @GET(Endpoints.getAllSubjects)
  Future<SubjectsResponse> getAllSubjects({
    @Header(ArgParam.token) String? token,
}
      );
}
