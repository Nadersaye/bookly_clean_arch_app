import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  final List<BookEntity> books;
  const BestSellerListView({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(
            book: books[index],
          ),
        );
      },
    );
  }
}
