import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch_app/core/utils/errors/failure.dart';
import 'package:bookly_clean_arch_app/core/utils/use_cases/base_use_case.dart';
import 'package:bookly_clean_arch_app/core/utils/use_cases/no_param.dart';
import 'package:dartz/dartz.dart';

import '../repos/base_bookly_repo.dart';

class FetchNewestBooksUseCase extends BaseUseCase<List<BookEntity>, NoParam> {
  final BaseBooklyRepo _baseBooklyRepo;

  FetchNewestBooksUseCase({required BaseBooklyRepo baseBooklyRepo})
      : _baseBooklyRepo = baseBooklyRepo;
  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) async {
    //manage permission here
    return await _baseBooklyRepo.fetchNewestBooks();
  }
}
