import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/book_entity.dart';

part 'featured_books_event.dart';
part 'featured_books_state.dart';

class FeaturedBooksBloc extends Bloc<FeaturedBooksEvent, FeaturedBooksState> {
  FeaturedBooksBloc() : super(FeaturedBooksInitial()) {
    on<FeaturedBooksEvent>((event, emit) {
      
    });
  }
}
