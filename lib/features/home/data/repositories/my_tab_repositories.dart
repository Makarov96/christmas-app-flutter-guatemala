import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../model/tab_model.dart';

abstract class MyTabRepositories {
  Future<Either<Failure, List<TabModel>>> call();
}
