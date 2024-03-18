import 'package:bookly_app/Features/Home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookEntity>>> fetchNewestBooks();
  Future<Either<Failures, List<BookEntity>>> fetchFeaturedBooks();
  // Future<Either<Failures, List<BookEntity>>> fetchSimilerBooks(
      // {required String category});
}