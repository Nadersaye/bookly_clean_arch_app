import 'package:bookly_clean_arch_app/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/fetch featured books cubit/fetch_featured_books_cubit.dart';

class FeaturedListViewBlocBuilder extends StatelessWidget {
  const FeaturedListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchFeaturedBooksCubit, FetchFeaturedBooksState>(
      builder: (context, state) {
        if (state is FetchFeaturedBooksLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FetchFeaturedBooksLoaded) {
          return FeaturedBooksListView(books: state.books);
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
