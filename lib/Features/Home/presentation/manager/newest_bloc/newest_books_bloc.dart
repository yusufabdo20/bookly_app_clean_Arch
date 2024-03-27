import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/book_entity.dart';

part 'newest_books_event.dart';
part 'newest_books_state.dart';

class NewestBooksBloc extends Bloc<NewestBooksEvent, NewestBooksState> {
  NewestBooksBloc() : super(NewestBooksInitial()) {
    on<NewestBooksEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
