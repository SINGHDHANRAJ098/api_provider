import "package:provider_ecom/Model/product_model.dart";

class CartModel {
  final int id;
  final List<ProductModel> products;
  final num total;
  final num discountedTotal;
  final int userId;
  final int totalProducts;
  final int totalQuantity;

  CartModel({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });
  factory CartModel.formJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      products: (json['products'] as List).map((p) => ProductModel.fromJson(p)).toList(),
      total: json['total'],
      discountedTotal: json['discountedTotal'],
      userId: json['userId'],
      totalProducts: json['totalProducts'],
      totalQuantity: json['totalQuantity'],
    );
  }
}
