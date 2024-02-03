import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/book_entity.dart';
import '../../../domain/use_cases/fetch_newest_books_use_case.dart';
part 'fetch_newest_books_state.dart';

class FetchNewestBooksCubit extends Cubit<FetchNewestBooksState> {
  FetchNewestBooksCubit(this._fetchNewestBooksUseCase)
      : super(FetchNewestBooksInitial());
  final FetchNewestBooksUseCase _fetchNewestBooksUseCase;
  Future fetchNewestBooks() async {
    emit(FetchNewestBooksLoading());
    final result = await _fetchNewestBooksUseCase.call();
    result.fold(
      (failure) =>
          emit(FetchNewestBooksError(errorMessage: failure.errorMessage)),
      (books) => emit(FetchNewestBooksLoaded(books: books)),
    );
  }
}
