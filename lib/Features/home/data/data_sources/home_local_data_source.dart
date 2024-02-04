import 'package:hive_flutter/hive_flutter.dart';
import '../../../../constants.dart';
import '../../domain/entities/book_entity.dart';

abstract class BaseHomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchNewestBooks({int pageNumber = 0});
}

class HomeLocalDataSource implements BaseHomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var featuedBox = Hive.box<BookEntity>(kFeaturedBox);
    int length = featuedBox.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return featuedBox.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;

    var newestBox = Hive.box<BookEntity>(kNewestBox);
    int length = newestBox.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return newestBox.values.toList().sublist(startIndex, endIndex);
  }
}
