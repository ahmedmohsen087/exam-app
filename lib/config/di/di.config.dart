// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/sign_up/api/client/sign_up_client.dart' as _i359;
import '../../features/auth/sign_up/api/data_sources/sign_up_remote_data_source_imp.dart'
    as _i272;
import '../../features/auth/sign_up/data/data_sources/sign_up_remote_data_source.dart'
    as _i897;
import '../../features/auth/sign_up/data/repositories/sign_up_repo_imp.dart'
    as _i311;
import '../../features/auth/sign_up/domain/repositories/sign_up_repo.dart'
    as _i924;
import '../../features/auth/sign_up/domain/use_cases/sign_up_use_case.dart'
    as _i45;
import '../../features/auth/sign_up/presentation/view_model/cubit/sign_up_cubit.dart'
    as _i667;
import 'modules/dio_module.dart' as _i983;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.factory<_i359.SignUpClient>(() => _i359.SignUpClient(gh<_i361.Dio>()));
    gh.factory<_i897.SignUpRemoteDataSource>(
      () => _i272.SignUpRemoteDataSourceImp(gh<_i359.SignUpClient>()),
    );
    gh.factory<_i924.SignUpRepo>(
      () => _i311.SignUpRepoImp(gh<_i897.SignUpRemoteDataSource>()),
    );
    gh.factory<_i45.SignUpUseCase>(
      () => _i45.SignUpUseCase(gh<_i924.SignUpRepo>()),
    );
    gh.factory<_i667.SignUpCubit>(
      () => _i667.SignUpCubit(gh<_i45.SignUpUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i983.DioModule {}
