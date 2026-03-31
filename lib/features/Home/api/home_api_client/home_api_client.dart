

import 'package:dio/dio.dart';
import 'package:exam_app/features/Home/data/models/subject_dto.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/values/endpoints.dart';

part 'home_api_client.g.dart';

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class HomeApiClient {
  factory HomeApiClient(Dio dio, {String? baseUrl}) = _HomeApiClient;

  @GET(Endpoints.getAllSubjects)
  Future<List<SubjectDto>> getAllSubjects();
}