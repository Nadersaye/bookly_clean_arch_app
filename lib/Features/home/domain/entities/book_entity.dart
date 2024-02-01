import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity extends Equatable {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String author;
  @HiveField(3)
  final String image;
  @HiveField(4)
  final num price;
  @HiveField(5)
  final num rating;
  @HiveField(6)
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
