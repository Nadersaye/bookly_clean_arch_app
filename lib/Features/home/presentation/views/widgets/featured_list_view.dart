import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/book_entity.dart';
import '../../manager/fetch featured books cubit/fetch_featured_books_cubit.dart';
import 'custom_book_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  final List<BookEntity> books;
  const FeaturedBooksListView({Key? key, required this.books})
      : super(key: key);

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  bool isLoading = false;
  int nextPage = 1;
  final ScrollController _scrollController = ScrollController();
  static const scrollThreshold = 0.7;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() async {
    double pixels = _scrollController.position.pixels;
    double maxScroll = _scrollController.position.maxScrollExtent;
    if (pixels >= maxScroll * scrollThreshold) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FetchFeaturedBooksCubit>(context)
            .fetchFeaturedBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: widget.books.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CustomBookImage(
                book: widget.books[index],
              ),
            );
          }),
    );
  }
}
