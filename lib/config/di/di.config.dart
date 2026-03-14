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
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/forget_password/api/client/forget_password_client.dart'
    as _i356;
import '../../features/auth/forget_password/api/data_source/forgot_password/forgot_password_remote_data_source_imp.dart'
    as _i358;
import '../../features/auth/forget_password/api/data_source/reset_password/reset_password_remote_data_source_imp.dart'
    as _i232;
import '../../features/auth/forget_password/api/data_source/verify_reset_code/verify_reset_code_remote_data_source_impl.dart'
    as _i168;
import '../../features/auth/forget_password/data/data_sources/forgot_password/forgot_password_remote_data_source.dart'
    as _i978;
import '../../features/auth/forget_password/data/data_sources/reset_password/reset_password_remote_data_source.dart'
    as _i270;
import '../../features/auth/forget_password/data/data_sources/verify_reset_code/verify_reset_code_remote_data_source.dart'
    as _i918;
import '../../features/auth/forget_password/data/repositories/forget_password_repo_imp.dart'
    as _i636;
import '../../features/auth/forget_password/data/repositories/reset_password_repo_imp.dart'
    as _i286;
import '../../features/auth/forget_password/data/repositories/verify_reset_code_repo_imp.dart'
    as _i891;
import '../../features/auth/forget_password/domain/repositories/forget_password_repo.dart'
    as _i924;
import '../../features/auth/forget_password/domain/repositories/reset_password_repo.dart'
    as _i33;
import '../../features/auth/forget_password/domain/repositories/verify_reset_code_repo.dart'
    as _i740;
import '../../features/auth/forget_password/domain/usecases/forget_password_use_case.dart'
    as _i737;
import '../../features/auth/forget_password/domain/usecases/reset_password_use_case.dart'
    as _i374;
import '../../features/auth/forget_password/domain/usecases/verify_reset_code_use_case.dart'
    as _i430;
import '../../features/auth/forget_password/presentation/view_model/cubit/forget_password_cubit.dart'
    as _i621;
import '../../features/auth/sign_in/api/client/sign_in_client.dart' as _i739;
import 'modules/dio_module.dart' as _i983;
import 'shared_prefs_module.dart' as _i295;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPrefsModule = _$SharedPrefsModule();
    final dioModule = _$DioModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPrefsModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.factory<_i356.ForgetPasswordClient>(
      () => _i356.ForgetPasswordClient(gh<_i361.Dio>()),
    );
    gh.factory<_i739.SignInClient>(() => _i739.SignInClient(gh<_i361.Dio>()));
    gh.factory<_i918.VerifyResetCodeRemoteDataSource>(
      () => _i168.VerifyResetCodeRemoteDataSourceImp(
        gh<_i356.ForgetPasswordClient>(),
      ),
    );
    gh.factory<_i978.ForgotPasswordRemoteDataSource>(
      () => _i358.ForgotPasswordRemoteDataSourceImp(
        gh<_i356.ForgetPasswordClient>(),
      ),
    );
    gh.factory<_i740.VerifyResetCodeRepo>(
      () => _i891.VerifyResetCodeRepoImpl(
        gh<_i918.VerifyResetCodeRemoteDataSource>(),
      ),
    );
    gh.factory<_i270.ResetPasswordRemoteDataSource>(
      () => _i232.ResetPasswordRemoteDataSourceImpl(
        gh<_i356.ForgetPasswordClient>(),
      ),
    );
    gh.factory<_i924.ForgetPasswordRepo>(
      () => _i636.ForgetPasswordRepoImpl(
        gh<_i978.ForgotPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i430.VerifyResetCodeUseCase>(
      () => _i430.VerifyResetCodeUseCase(gh<_i740.VerifyResetCodeRepo>()),
    );
    gh.factory<_i737.ForgotPasswordUseCase>(
      () => _i737.ForgotPasswordUseCase(gh<_i924.ForgetPasswordRepo>()),
    );
    gh.factory<_i33.ResetPasswordRepo>(
      () => _i286.ResetPasswordRepoImpl(
        gh<_i270.ResetPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i374.ResetPasswordUseCase>(
      () => _i374.ResetPasswordUseCase(gh<_i33.ResetPasswordRepo>()),
    );
    gh.factory<_i621.ForgotPasswordCubit>(
      () => _i621.ForgotPasswordCubit(
        gh<_i737.ForgotPasswordUseCase>(),
        gh<_i430.VerifyResetCodeUseCase>(),
        gh<_i374.ResetPasswordUseCase>(),
      ),
    );
    return this;
  }
}

class _$SharedPrefsModule extends _i295.SharedPrefsModule {}

class _$DioModule extends _i983.DioModule {}
