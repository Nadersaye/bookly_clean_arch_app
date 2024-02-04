import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/fetch newest books cubit/fetch_newest_books_cubit.dart';
import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatefulWidget {
  final List<BookEntity> books;
  const BestSellerListView({super.key, required this.books});

  @override
  State<BestSellerListView> createState() => _BestSellerListViewState();
}

class _BestSellerListViewState extends State<BestSellerListView> {
  int nextPage = 1;
  bool isLoading = false;
  final ScrollController _scrollController = ScrollController();
  static const scrollThreshold = 0.7;
  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() async {
    double pixels = _scrollController.position.pixels;
    double maxScroll = _scrollController.position.maxScrollExtent;
    if (pixels >= maxScroll * scrollThreshold) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FetchNewestBooksCubit>(context)
            .fetchNewestBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(
            book: widget.books[index],
          ),
        );
      },
    );
  }
}
