import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import '../../../../core/values/app_param.dart';
import '../../../../core/values/endpoints.dart';

@injectable
@RestApi()
abstract class HomeApiClient {
 // @factoryMethod
  //factory HomeApiClient(Dio dio) = _HomeApiClient;

//   @GET(
//       Endpoints.getAllSubjects)
//   Future<ProductsResponse> getAllSubjects({
//     @Query(AppParam.token) String? token,
// });


}