import 'package:dartz/dartz.dart';

import '../errors/failures.dart';

abstract class UseCase<Type, Pramp> {
  Future<Either<Failures, Type>> call([Pramp p]);
}
