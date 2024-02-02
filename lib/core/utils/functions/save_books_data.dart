import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

saveBooksData(List<BookEntity> books, String boxName) {
  Box<BookEntity> box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}
