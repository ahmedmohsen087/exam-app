
import 'package:exam_app/features/Home/api/home_api_client/home_api_client.dart';
import 'package:injectable/injectable.dart';

import '../../data/data_sources/home_remote_data_source_contract.dart';
import '../../data/models/subject_dto.dart';

@Injectable(as: HomeRemoteDataSourceContract)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSourceContract {

  final HomeApiClient homeApiClient;

  HomeRemoteDataSourceImpl(this.homeApiClient);

  @override
  Future<List<SubjectDto>> getAllSubjects() {
    return homeApiClient.getAllSubjects();

  }




}