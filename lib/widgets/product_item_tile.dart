import 'package:flutter/material.dart';
import '../Model/product_model.dart';

class ProductItemTile extends StatelessWidget {
  final ProductModel product;

  const ProductItemTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(product.thumbnail, width: 45),
      title: Text(product.title),
      subtitle: Text(
        "Qty: ${product.quantity} × ₹${product.price}\n"
            "Discounted: ₹${product.discountedTotal}",
      ),
      trailing: Text(
        "₹${product.total}",
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
