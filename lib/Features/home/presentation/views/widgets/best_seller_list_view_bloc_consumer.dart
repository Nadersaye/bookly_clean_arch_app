import 'package:bookly_clean_arch_app/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/book_entity.dart';
import '../../manager/fetch newest books cubit/fetch_newest_books_cubit.dart';

class BestSellerListViewBlocConsumer extends StatefulWidget {
  const BestSellerListViewBlocConsumer({super.key});

  @override
  State<BestSellerListViewBlocConsumer> createState() =>
      _BestSellerListViewBlocConsumerState();
}

class _BestSellerListViewBlocConsumerState
    extends State<BestSellerListViewBlocConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchNewestBooksCubit, FetchNewestBooksState>(
      listener: (BuildContext context, FetchNewestBooksState state) {
        if (state is FetchNewestBooksLoaded) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is FetchNewestBooksLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FetchNewestBooksLoaded ||
            state is FetchNewestBooksPaginationLoading ||
            state is FetchNewestBooksPaginationError) {
          return BestSellerListView(books: books);
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
