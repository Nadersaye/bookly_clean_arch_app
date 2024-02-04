part of 'fetch_newest_books_cubit.dart';

sealed class FetchNewestBooksState extends Equatable {
  const FetchNewestBooksState();

  @override
  List<Object> get props => [];
}

final class FetchNewestBooksInitial extends FetchNewestBooksState {}

final class FetchNewestBooksLoading extends FetchNewestBooksState {}

final class FetchNewestBooksPaginationLoading extends FetchNewestBooksState {}

final class FetchNewestBooksLoaded extends FetchNewestBooksState {
  final List<BookEntity> books;

  const FetchNewestBooksLoaded({required this.books});

  @override
  List<Object> get props => [books];
}

final class FetchNewestBooksError extends FetchNewestBooksState {
  final String errorMessage;

  const FetchNewestBooksError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class FetchNewestBooksPaginationError extends FetchNewestBooksState {
  final String errorMessage;

  const FetchNewestBooksPaginationError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
