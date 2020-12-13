import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failure.dart';
import '../datasources/localdatasource.dart';
import '../model/tree.dart';
import 'my_tree_repositories.dart';

@prod
@Injectable(as: MyTreeRepositories, env: [Environment.prod])
@injectable
class MyTreeRepositoriesImpl implements MyTreeRepositories {
  final LocalDataSource localDataSource;

  MyTreeRepositoriesImpl({
    @required this.localDataSource,
  });
  @override
  Future<Either<Failure, List<TreeModel>>> call() async {
    try {
      final myList = await localDataSource.myCustomData();
      return Right(myList);
    } on Failure {
      return Left(
        Failure('Ha sucedio un error'),
      );
    }
  }
}
