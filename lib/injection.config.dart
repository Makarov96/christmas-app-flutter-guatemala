// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'features/home/presentation/bloc/get_data_tab_provider.dart';
import 'features/home/presentation/bloc/get_data_tree_provider.dart';
import 'features/home/data/datasources/localdatasource.dart';
import 'features/home/data/repositories/my_tab_repositories.dart';
import 'features/home/data/repositories/my_tree_repositories.dart';
import 'features/home/data/repositories/my_tab_repositories_impl.dart';
import 'features/home/data/repositories/my_tree_repositories_impl.dart'
    as flutter_christmas_app;

/// Environment names
const _prod = 'prod';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factory<LocalDataSource>(() => LocalDataSource());
  gh.factory<MyTabRepositories>(
      () => MyTreeRepositoriesImpl(localDataSource: get<LocalDataSource>()),
      registerFor: {_prod});
  gh.factory<MyTreeRepositories>(
      () => flutter_christmas_app.MyTreeRepositoriesImpl(
          localDataSource: get<LocalDataSource>()),
      registerFor: {_prod});
  gh.factory<GetDataTabProvider>(
      () => GetDataTabProvider(repository: get<MyTabRepositories>()));
  gh.factory<GetDataTreeProvider>(
      () => GetDataTreeProvider(repository: get<MyTreeRepositories>()));
  return get;
}
