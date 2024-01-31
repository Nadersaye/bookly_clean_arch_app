import 'package:bookly_clean_arch_app/Features/home/data/models/list_price_model.dart';

class SaleInfoModel {
  final ListPriceModel? listPrice;

  SaleInfoModel({required this.listPrice});

  factory SaleInfoModel.fromJson(Map<String, dynamic> json) {
    return SaleInfoModel(
        listPrice: json['listPrice'] == null
            ? null
            : ListPriceModel.fromJson(
                json['listPrice'] as Map<String, dynamic>));
  }
}
