import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/use_cases/fetch_featured_books_use_case.dart';

part 'fetch_featured_books_state.dart';

class FetchFeaturedBooksCubit extends Cubit<FetchFeaturedBooksState> {
  FetchFeaturedBooksCubit(this._fetchFeaturedBooksUseCase)
      : super(FetchFeaturedBooksInitial());
  final FetchFeaturedBooksUseCase _fetchFeaturedBooksUseCase;
  Future fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FetchFeaturedBooksLoading());
    } else {
      emit(FetchFeaturedBooksPaginationLoading());
    }
    final result = await _fetchFeaturedBooksUseCase.call(pageNumber);
    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(FetchFeaturedBooksError(errorMessage: failure.errorMessage));
        } else {
          emit(FetchFeaturedBooksPaginationError(
              errorMessage: failure.errorMessage));
        }
      },
      (books) => emit(FetchFeaturedBooksLoaded(books: books)),
    );
  }
}
