import 'package:dio/dio.dart';
import 'package:exam_app/core/values/endpoints.dart';
import 'package:injectable/injectable.dart';



@module
abstract class DioModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: Endpoints.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        request: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );

    return dio;
  }
}
