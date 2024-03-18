import 'package:bookly_app/Features/Home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/use_cases/no_param_use_case.dart';
import '../entities/book_entity.dart';

class FetchNewestBooksUseCase extends UseCaseNoParam<List<BookEntity>> {
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failures, List<BookEntity>>> call() {
    return homeRepo.fetchNewestBooks();
  }
}
