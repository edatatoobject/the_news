// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repositories/mock_news_repository_impl.dart' as _i5;
import '../../domain/repositories/news_repository.dart' as _i4;
import '../../presentation/bloc/news_bloc.dart' as _i6;
import '../config/config.dart' as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.Config>(_i3.Config());
  gh.factory<_i4.NewsRepository>(() => _i5.MockNewsRepositoryImpl());
  gh.factory<_i6.NewsBloc>(() => _i6.NewsBloc(get<_i4.NewsRepository>()));
  return get;
}
