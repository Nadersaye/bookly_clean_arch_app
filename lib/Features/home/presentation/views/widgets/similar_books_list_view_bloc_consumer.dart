import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch_app/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/fetch newest books cubit/fetch_newest_books_cubit.dart';

class SimilarBooksListViewBlocConsumer extends StatefulWidget {
  const SimilarBooksListViewBlocConsumer({super.key});

  @override
  State<SimilarBooksListViewBlocConsumer> createState() =>
      _SimilarBooksListViewBlocConsumerState();
}

class _SimilarBooksListViewBlocConsumerState
    extends State<SimilarBooksListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchNewestBooksCubit, FetchNewestBooksState>(
      listener: (context, state) => {},
      builder: (context, state) {
        if (state is FetchNewestBooksLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FetchNewestBooksLoaded) {
          return SimilarBooksListview(books: state.books);
        } else if (state is FetchNewestBooksError) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
