import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../model/tree.dart';

abstract class MyTreeRepositories {
  Future<Either<Failure, List<TreeModel>>> call();
}
