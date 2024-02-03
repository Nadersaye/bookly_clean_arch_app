import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch_app/core/errors/failure.dart';
import 'package:bookly_clean_arch_app/core/use_cases/base_use_case.dart';
import 'package:bookly_clean_arch_app/core/use_cases/no_param.dart';
import 'package:dartz/dartz.dart';

import '../repos/base_home_repo.dart';

class FetchNewestBooksUseCase extends BaseUseCase<List<BookEntity>, NoParam> {
  final BaseHomeRepo _baseHomeRepo;

  FetchNewestBooksUseCase({required BaseHomeRepo baseHomeRepo})
      : _baseHomeRepo = baseHomeRepo;
  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) async {
    //manage permission here
    return await _baseHomeRepo.fetchNewestBooks();
  }
}
