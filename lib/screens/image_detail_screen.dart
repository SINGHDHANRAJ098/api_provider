import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ecom/providers/select_image_provider.dart';

class ImageDetailScreen extends StatelessWidget {
  const ImageDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectImageProvider>(
      builder: (context, provider, child) {
        final product = provider.product;

        if (product == null) {
          return Scaffold(body: Center(child: Text("no product")));
        }

        return Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: Text(product.title),
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    product.thumbnail,
                    height: 260,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 18),
                Text(
                  product.title,

                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 10),
                Text(
                  "${product.price}",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
