import 'package:equatable/equatable.dart';

class BookEntity extends Equatable {
  final String bookId;
  final String title;
  final String author;
  final String image;
  final num price;
  final num rating;
  final int count;

  const BookEntity({
    required this.title,
    required this.author,
    required this.image,
    required this.bookId,
    required this.price,
    required this.rating,
    required this.count,
  });

  @override
  List<Object?> get props =>
      [title, author, image, bookId, price, rating, count];
}
