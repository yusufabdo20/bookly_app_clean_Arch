import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/book_entity.dart';
import '../../../domain/use_cases/featch_newest_books_use_case.dart';

part 'newest_books_event.dart';
part 'newest_books_state.dart';

class NewestBooksBloc extends Bloc<NewestBooksEvent, NewestBooksState> {
  final FetchNewestBooksUseCase newestBooksUseCase;
  List<BookEntity> books = [];
  NewestBooksBloc({required this.newestBooksUseCase})
      : super(NewestBooksInitial()) {
    on<NewestBooksEvent>((event, emit) async {
      if (event is GetNewestBooksEvent) {
        emit(NewestBooksLoading());
        var result = await newestBooksUseCase.call();
        result.fold(
            (failure) => emit(NewestBooksFailure(error: failure.errMessage)),
            (r) {
          books = r;
          emit(NewestBooksSuccess(books: books));
        });
      }
    });
  }
}
