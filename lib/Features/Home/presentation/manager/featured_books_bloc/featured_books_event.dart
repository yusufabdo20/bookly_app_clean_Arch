part of 'featured_books_bloc.dart';

abstract class FeaturedBooksEvent {
  const FeaturedBooksEvent();
}

class GetFeaturedBooksEvent extends FeaturedBooksEvent {
  const GetFeaturedBooksEvent();
}
