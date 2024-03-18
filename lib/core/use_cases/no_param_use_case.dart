import 'package:dartz/dartz.dart';

import '../errors/failures.dart';

abstract class UseCaseNoParam<Type> {
  Future<Either<Failures, Type>> call();
}
