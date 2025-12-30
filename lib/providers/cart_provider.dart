import 'package:flutter/cupertino.dart';
import 'package:provider_ecom/services/cart_api.dart';

class CartProvider extends ChangeNotifier{
  final _api = CartApi();
  bool isLoading = false;


}