import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch_app/core/errors/failure.dart';
import 'package:bookly_clean_arch_app/core/use_cases/base_use_case.dart';
import 'package:dartz/dartz.dart';

import '../repos/base_home_repo.dart';

class FetchFeaturedBooksUseCase extends BaseUseCase<List<BookEntity>, int> {
  final BaseHomeRepo _baseBooklyRepo;

  FetchFeaturedBooksUseCase({required BaseHomeRepo baseBooklyRepo})
      : _baseBooklyRepo = baseBooklyRepo;
  @override
  Future<Either<Failure, List<BookEntity>>> call([int? param]) async {
    //manage permission here
    return await _baseBooklyRepo.fetchFeaturedBooks();
  }
}
