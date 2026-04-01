import 'package:exam_app/features/Home/domain/entities/subjects_models.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repo/home_repo_contract.dart';
import '../data_sources/home_remote_data_source_contract.dart';

@Injectable(as: HomeRepoContract)
class HomeRepoImpl implements HomeRepoContract {

  final HomeRemoteDataSourceContract homeRemoteDataSourceContract;

  HomeRepoImpl(this.homeRemoteDataSourceContract);


  @override
  Future<List<SubjectsModels>> getAllSubjects({String ? token,}) {
    return homeRemoteDataSourceContract.getAllSubjects().then((AllSubjectsDto){
      return AllSubjectsDto.map((dto) => dto.toDomain()).toList();
    });
  

  }

}