import 'package:flutter/material.dart';
import '../../../domain/entities/book_entity.dart';
import 'custom_cached_network_image.dart';

class CustomBookImage extends StatelessWidget {
  final BookEntity book;
  const CustomBookImage({Key? key, required this.book}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CustomCachedNetworkImage(book: book),
      ),
    );
  }
}
