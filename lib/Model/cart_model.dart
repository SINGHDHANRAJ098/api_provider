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



}
