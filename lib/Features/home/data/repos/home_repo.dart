import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch_app/Features/home/domain/repos/base_home_repo.dart';
import 'package:bookly_clean_arch_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../data_sources/home_local_data_source.dart';
import '../data_sources/home_remote_data_source.dart';

class HomeRepo implements BaseHomeRepo {
  final BaseHomeRemoteDataSource remoteDataSource;
  final BaseHomeLocalDataSource localDataSource;

  HomeRepo({required this.remoteDataSource, required this.localDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      int pageNumber) async {
    try {
      List<BookEntity> books;
      books = localDataSource.fetchFeaturedBooks();
      if (books.isNotEmpty) {
        return Right(books);
      }
      books = await remoteDataSource.fetchFeaturedBooks(pageNumber);

      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks(
      int pageNumber) async {
    try {
      List<BookEntity> books;
      books = localDataSource.fetchNewestBooks(pageNumber: pageNumber);
      if (books.isNotEmpty) {
        return Right(books);
      }
      books = await remoteDataSource.fetchNewestBooks(pageNumber);
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
