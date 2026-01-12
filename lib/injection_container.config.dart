// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import 'core/network/network_info.dart' as _i75;
import 'core/util/input_converter.dart' as _i702;
import 'features/number_trivia/data/datasources/number_trivia_local_datasource.dart'
    as _i1020;
import 'features/number_trivia/data/datasources/number_trivia_remote_datasource.dart'
    as _i724;
import 'features/number_trivia/data/repositories/number_trivia_repository_impl.dart'
    as _i36;
import 'features/number_trivia/domain/contracts/number_trivia_repository_contract.dart'
    as _i90;
import 'features/number_trivia/domain/usecases/get_concrete_number_trivia.dart'
    as _i285;
import 'features/number_trivia/domain/usecases/get_random_number_trivia.dart'
    as _i722;
import 'features/number_trivia/presentation/bloc/number_trivia_bloc.dart'
    as _i65;
import 'injection_container.dart' as _i809;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i702.InputConverter>(() => _i702.InputConverter());
    gh.lazySingleton<_i519.Client>(() => registerModule.httpClient);
    gh.lazySingleton<_i973.InternetConnectionChecker>(
      () => registerModule.dataConnectionChecker,
    );
    gh.lazySingleton<_i1020.NumberTriviaLocalDataSource>(
      () => _i1020.NumberTriviaLocalDataSourceImpl(
        sharedPreferences: gh<_i460.SharedPreferences>(),
      ),
    );
    gh.lazySingleton<_i75.NetworkInfo>(
      () => _i75.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()),
    );
    gh.lazySingleton<_i724.NumberTriviaRemoteDataSource>(
      () => _i724.NumberTriviaRemoteDataSourceImpl(client: gh<_i519.Client>()),
    );
    gh.lazySingleton<_i90.NumberTriviaRepository>(
      () => _i36.NumberTriviaRepositoryImpl(
        remoteDataSource: gh<_i724.NumberTriviaRemoteDataSource>(),
        localDataSource: gh<_i1020.NumberTriviaLocalDataSource>(),
        networkInfo: gh<_i75.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i285.GetConcreteNumberTrivia>(
      () => _i285.GetConcreteNumberTrivia(gh<_i90.NumberTriviaRepository>()),
    );
    gh.lazySingleton<_i722.GetRandomNumberTrivia>(
      () => _i722.GetRandomNumberTrivia(gh<_i90.NumberTriviaRepository>()),
    );
    gh.factory<_i65.NumberTriviaBloc>(
      () => _i65.NumberTriviaBloc(
        getConcreteNumberTrivia: gh<_i285.GetConcreteNumberTrivia>(),
        getRandomNumberTrivia: gh<_i722.GetRandomNumberTrivia>(),
        inputConverter: gh<_i702.InputConverter>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i809.RegisterModule {}
