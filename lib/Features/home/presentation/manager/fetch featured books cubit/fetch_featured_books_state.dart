part of 'fetch_featured_books_cubit.dart';

sealed class FetchFeaturedBooksState extends Equatable {
  const FetchFeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FetchFeaturedBooksInitial extends FetchFeaturedBooksState {}

final class FetchFeaturedBooksLoading extends FetchFeaturedBooksState {}

final class FetchFeaturedBooksPaginationLoading
    extends FetchFeaturedBooksState {}

final class FetchFeaturedBooksLoaded extends FetchFeaturedBooksState {
  final List<BookEntity> books;

  const FetchFeaturedBooksLoaded({required this.books});

  @override
  List<Object> get props => [books];
}

final class FetchFeaturedBooksError extends FetchFeaturedBooksState {
  final String errorMessage;

  const FetchFeaturedBooksError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class FetchFeaturedBooksPaginationError extends FetchFeaturedBooksState {
  final String errorMessage;

  const FetchFeaturedBooksPaginationError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
