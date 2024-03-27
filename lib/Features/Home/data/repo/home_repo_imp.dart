import 'package:bookly_app/Features/Home/domain/entities/book_entity.dart';

import 'package:bookly_app/core/errors/failures.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repos/home_repo.dart';
import '../data_sources/local/home_local_data_source.dart';
import '../data_sources/remote/home_remote_data_source.dart';

class HomeRepoImp extends HomeRepo {
  final HomeRemoteDataSource homeRDS;
  final HomeLocalDataSource homeLDS;

  HomeRepoImp({required this.homeRDS, required this.homeLDS});
  @override
  Future<Either<Failures, List<BookEntity>>> fetchFeaturedBooks() async{
    try {
      var cachedBooks = homeLDS.fetchFeaturedBooks();
      if (cachedBooks.isNotEmpty) {
        return right(cachedBooks);
      }
      var books = await homeRDS.fetchFeaturedBooks();
      return right(books);
    } catch (e) {
      return left(ServerError(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookEntity>>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}
