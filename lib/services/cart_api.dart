import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:provider_ecom/Model/cart_model.dart';

class CartApi {
  final _baseUrl = "https://dummyjson.com/carts";

  Future<List<CartModel>> fetchCart() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['carts'] as List)
          .map((cart) => CartModel.formJson(cart))
          .toList();
    }
    throw Exception("data not found");
  }
}
