class ListPriceModel {
  final num? amount;

  ListPriceModel({required this.amount});
  factory ListPriceModel.fromJson(Map<String, dynamic> json) {
    return ListPriceModel(amount: (json['amount'] as num?)?.toDouble());
  }
}
