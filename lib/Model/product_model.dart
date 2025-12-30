class ProductModel {
  final int id;
  final String title;
  final num price;
  final int quantity;
  final num total;
  final num discountPercentage;
  final num discountedTotal;
  final String thumbnail;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedTotal,
    required this.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      quantity: json['quantity'],
      total: json['total'],
      discountPercentage: json['discountPercentage'],
      discountedTotal: json['discountedTotal'],
      thumbnail: json['thumbnail'],
    );
  }
}

