import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/Home/domain/repos/home_repo.dart';
import 'package:bookly_app/Features/Home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/book_entity.dart';

part 'featured_books_event.dart';
part 'featured_books_state.dart';

class FeaturedBooksBloc extends Bloc<FeaturedBooksEvent, FeaturedBooksState> {
  FetchFeaturdBooksUseCase featurdBooksUseCase;
  List<BookEntity> books = [];
  FeaturedBooksBloc({required this.featurdBooksUseCase})
      : super(FeaturedBooksInitial()) {
    on<FeaturedBooksEvent>((event, emit) async {
      if (event is GetFeaturedBooksEvent) {
        emit(FeaturedBooksLoading());
        var result = await featurdBooksUseCase.call();
        result.fold(
            (failure) => emit(FeaturedBooksFailure(error: failure.errMessage)),
            (r) {
          books = r;
          emit(FeaturedBooksSuccess(books: books));
        });
      }
    });
  }
}
