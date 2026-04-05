import 'package:exam_app/features/Home/data/models/subject_dto.dart';
import 'package:exam_app/features/Home/domain/entities/subjects_models.dart';
import 'package:injectable/injectable.dart';
import '../../../../config/base_response/base_response.dart';
import '../../domain/repo/home_repo_contract.dart';
import '../data_sources/home_remote_data_source_contract.dart';

@Injectable(as: HomeRepoContract)
class HomeRepoImpl implements HomeRepoContract {

  final HomeRemoteDataSourceContract homeRemoteDataSourceContract;

  HomeRepoImpl(this.homeRemoteDataSourceContract);


  @override
  Future<BaseResponse<List<SubjectsModels>>> getAllSubjects({String ? token,}) async {
    final response = await homeRemoteDataSourceContract.getAllSubjects(
      token: token,
    );
    switch (response){
      case Success<List<SubjectDto>>():
        return Success<List<SubjectsModels>>(data: response.data?.map((e) => e.toDomain()).toList()??[]);
      case Failed<List<SubjectDto>>():
        return Failed<List<SubjectsModels>>(error: response.error);

    }


  }

}