
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:exam_app/features/Home/api/home_api_client/home_api_client.dart';
import 'package:injectable/injectable.dart';
import '../../../../config/base_response/base_response.dart';
import '../../../../config/secure_storage/secure_storage_service.dart';
import '../../data/data_sources/home_remote_data_source_contract.dart';
import '../../data/models/subject_dto.dart';

@Injectable(as: HomeRemoteDataSourceContract)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSourceContract {
  final HomeApiClient homeApiClient;

  HomeRemoteDataSourceImpl(this.homeApiClient);

  @override
  Future<BaseResponse<List<SubjectDto>>> getAllSubjects({String?token}) async {
    try{
      final response = await homeApiClient.getAllSubjects(
        token: await SecureStorageService.readToken(),
      );
      return Success<List<SubjectDto>>(data: response.subjects??[]);
    }catch (e){
      if (e is DioException) {
        return Failed<List<SubjectDto>>(error: e ?? 'Dio Exception');
      } else if (e is TimeoutException) {
        return Failed<List<SubjectDto>>(error: e ?? "Timeout Exception");
      }
        return Failed<List<SubjectDto>>(error: e ?? 'Some Thing Went Wrong');


    }


  }
}

