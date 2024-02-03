import 'package:bookly_clean_arch_app/Features/home/data/models/book_model.dart';
import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch_app/constants.dart';
import 'package:bookly_clean_arch_app/core/utils/api_service.dart';
import 'package:bookly_clean_arch_app/core/utils/functions/save_books_data.dart';

abstract class BaseHomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSource implements BaseHomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSource({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    final response =
        await apiService.get("volumes?Filtering=free-ebooks&q=programming");
    List<BookEntity> books = getFeaturedBooks(response);
    saveBooksData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    final response = await apiService
        .get("volumes?Filtering=free-ebooks&Sorting=newest&q=programming");
    List<BookEntity> books = getBooksList(response);
    saveBooksData(books, kNewestBox);
    return books;
  }

  List<BookEntity> getFeaturedBooks(Map<String, dynamic> response) {
    return response["items"]
        .map<BookEntity>((book) => BookModel.fromJson(book))
        .toList();
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
