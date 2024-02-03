import 'package:bookly_clean_arch_app/Features/home/data/models/sale_info_model.dart';
import 'package:bookly_clean_arch_app/Features/home/data/models/volume_info_model.dart';
import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';

class BookModel extends BookEntity {
  final String id;
  final VolumeInfoModel? volumeInfo;
  final SaleInfoModel? saleInfo;

  BookModel(
      {required this.id, required this.volumeInfo, required this.saleInfo})
      : super(
            title: volumeInfo?.title ?? 'un known title',
            author: volumeInfo?.authors?.first ?? 'un known author',
            image: volumeInfo?.imageLinks?.thumbnail ??
                'https://salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png',
            bookId: id,
            price: 0.0,
            rating: 0,
            count: 0);

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      volumeInfo: json['volumeInfo'] == null
          ? null
          : VolumeInfoModel.fromJson(
              json['volumeInfo'] as Map<String, dynamic>),
      saleInfo: json['saleInfo'] == null
          ? null
          : SaleInfoModel.fromJson(json['saleInfo'] as Map<String, dynamic>),
    );
  }
}
