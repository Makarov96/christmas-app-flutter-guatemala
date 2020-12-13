import 'package:dartz/dartz.dart';
import 'package:flutter_christmas_app/features/home/data/datasources/localdatasource.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failure.dart';
import '../model/tab_model.dart';
import 'my_tab_repositories.dart';

@prod
@Injectable(as: MyTabRepositories, env: [Environment.prod])
@injectable
class MyTreeRepositoriesImpl implements MyTabRepositories {
  final LocalDataSource localDataSource;

  MyTreeRepositoriesImpl({
    @required this.localDataSource,
  });
  @override
  Future<Either<Failure, List<TabModel>>> call() async {
    try {
      final myList = await localDataSource.myTabData();
      return Right(myList);
    } on Failure {
      return Left(
        Failure('Ha sucedio un error'),
      );
    }
  }
}
