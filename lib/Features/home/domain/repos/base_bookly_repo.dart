import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/utils/errors/failure.dart';

abstract class BaseBooklyRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks();
}