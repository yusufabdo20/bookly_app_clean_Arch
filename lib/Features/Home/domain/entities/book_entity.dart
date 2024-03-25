class BookEntity {
  /// data representation in UI .
  final String? bookId;
  final String? image;
  final String? title;
  final String? authorName;
  final num? price;
  final num? ratting;

  BookEntity({
    required this.bookId,
    required this.image,
    required this.title,
    required this.authorName,
    required this.price,
    required this.ratting,
  });
}
