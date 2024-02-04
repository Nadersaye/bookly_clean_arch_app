import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch_app/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/fetch featured books cubit/fetch_featured_books_cubit.dart';

class FeaturedListViewBloConsumer extends StatefulWidget {
  const FeaturedListViewBloConsumer({super.key});

  @override
  State<FeaturedListViewBloConsumer> createState() =>
      _FeaturedListViewBloConsumerState();
}

class _FeaturedListViewBloConsumerState
    extends State<FeaturedListViewBloConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchFeaturedBooksCubit, FetchFeaturedBooksState>(
      listener: (context, state) => {
        if (state is FetchFeaturedBooksLoaded)
          {
            books.addAll(state.books),
          }
      },
      builder: (context, state) {
        if (state is FetchFeaturedBooksLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FetchFeaturedBooksLoaded ||
            state is FetchFeaturedBooksPaginationLoading ||
            state is FetchFeaturedBooksPaginationError) {
          return FeaturedBooksListView(books: books);
        } else if (state is FetchFeaturedBooksError) {
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
