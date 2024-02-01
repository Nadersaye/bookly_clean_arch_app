import 'package:hive_flutter/hive_flutter.dart';

import '../../../../constants.dart';
import '../../domain/entities/book_entity.dart';

abstract class BaseHomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSource implements BaseHomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var featuedBox = Hive.box<BookEntity>(kFeaturedBox);
    return featuedBox.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var featuedBox = Hive.box<BookEntity>(kNewestBox);
    return featuedBox.values.toList();
  }
}
