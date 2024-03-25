import 'package:hive_flutter/adapters.dart';
part'book_entity.g.dart' ; 
@HiveType(typeId: 0)
class BookEntity {
  /// data representation in UI .
  @HiveField(0)
  final String? bookId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  final String? authorName;
  @HiveField(4)
  final num? price;
  @HiveField(5)
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
