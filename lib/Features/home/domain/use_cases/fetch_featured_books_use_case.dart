import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch_app/core/utils/errors/failure.dart';
import 'package:bookly_clean_arch_app/core/utils/use_cases/base_use_case.dart';
import 'package:dartz/dartz.dart';

import '../repos/base_bookly_repo.dart';

class FetchFeaturedBooksUseCase extends BaseUseCase<List<BookEntity>, int> {
  final BaseBooklyRepo _baseBooklyRepo;

  FetchFeaturedBooksUseCase({required BaseBooklyRepo baseBooklyRepo})
      : _baseBooklyRepo = baseBooklyRepo;
  @override
  Future<Either<Failure, List<BookEntity>>> call([int? param]) async {
    //manage permission here
    return await _baseBooklyRepo.fetchFeaturedBooks();
  }
}
