import 'package:flutter/cupertino.dart';
import 'package:provider_ecom/Model/cart_model.dart';
import 'package:provider_ecom/Model/product_model.dart';
import 'package:provider_ecom/services/cart_api.dart';

class CartProvider extends ChangeNotifier {
  final _api = CartApi();
  bool isLoading = false;
  String? errorMessage;

  List<CartModel> _carts = [];
  List<CartModel> get carts => _carts;

  Future<void> loadCart() async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();
      _carts = await _api.fetchCart();
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
