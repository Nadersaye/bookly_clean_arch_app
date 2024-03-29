import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';

abstract class BaseHomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(int pageNumber);
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks(int pageNumber);
}
